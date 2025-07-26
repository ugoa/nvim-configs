-- how to load vimscript file
-- vim.cmd('source my_vim_script.vim')

local autocmd = vim.api.nvim_create_autocmd

-- Jump to last left position.
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

-- set filetype as undefined for unknown/empty filetypes
autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "" then
			vim.cmd([[ :setfiletype undefined ]])
		end
	end,
})

-- quick quit with `q` for interim buffers
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
		"Avante",
		"undefined",
	},
	callback = function()
		vim.keymap.set("n", "q", function()
			vim.cmd(":silent bw!")
			vim.api.nvim_input("<CR>")
		end, { desc = "Close the current buffer", buffer = true })
	end,
})

-- Remove trailing whitespaces before write
autocmd("FileType", {
	group = vim.api.nvim_create_augroup("trim_whitespaces", { clear = true }),
	desc = "Trim trailing white spaces",
	pattern = "*",
	callback = function()
		autocmd("BufWritePre", {

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

-- Trigger vim to autoload modifications from external
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	pattern = "*",
	command = "silent! checktime",
})

-- -- Open nvim-tree when startup, then move focus to buffer without closing the tree
-- autocmd("VimEnter", {
-- 	callback = function()
-- 		require("nvim-tree.api").tree.open()
-- 		if vim.fn.bufname():match("NvimTree_") then
-- 			vim.cmd.wincmd("p")
-- 		else
-- 			vim.cmd("NvimTreeFindFile")
-- 		end
-- 	end,
-- })

-- Disable diagnostics when the buffer is modified
autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.enable(false)
	end,
})

-- Enable diagnostics after writing the buffer
autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		vim.diagnostic.enable(true)
	end,
})

-- prevent quickfix buffer being listed
autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})
