local autocmd = vim.api.nvim_create_autocmd

-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
			vim.api.nvim_del_augroup_by_name("NvFilePost")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end
			end)
		end
	end,
})

autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line > 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})

autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "" then
			vim.cmd([[ :setfiletype undefined ]])
		end
	end,
})

autocmd("FileType", {
	pattern = {
		"notify",
		"checkhealth",
		"fugitive*",
		"git",
		"help",
		"lspinfo",
		"netrw",
		"notify",
		"qf",
		"query",
		"quickfix",
		"vim",
		"undefined",
	},
	callback = function()
		vim.keymap.set("n", "q", function()
			vim.cmd(":silent q!")
			vim.api.nvim_input("<CR>")
		end, { desc = "Close the current buffer", buffer = true })
	end,
})

autocmd("VimEnter", {
	callback = function(data)
		if vim.fn.argv(0) == "" then
			require("nvim-tree.api").tree.open()
		elseif vim.fn.isdirectory(data.file) == 1 then
			-- change to the directory and open the tree
			vim.cmd.cd(data.file)
			require("nvim-tree.api").tree.open()
		end
	end,
})

autocmd("FileType", {
	group = vim.api.nvim_create_augroup("trim_whitespaces", { clear = true }),
	desc = "Trim trailing white spaces",
	pattern = "*",
	callback = function()
		vim.api.nvim_create_autocmd("BufWritePre", {

			pattern = "<buffer>",
			-- Trim trailing whitespaces
			callback = function()
				-- Save cursor position to restore later
				local curpos = vim.api.nvim_win_get_cursor(0)
				-- Search and replace trailing whitespaces
				vim.cmd([[keeppatterns %s/\s\+$//e]])
				vim.api.nvim_win_set_cursor(0, curpos)
			end,
		})
	end,
})

-- how to load vimscript file
-- vim.cmd('source my_vim_script.vim')
