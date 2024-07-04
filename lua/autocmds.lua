require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd

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

autocmd("TermClose", {
	pattern = "*",
	callback = function()
		vim.api.nvim_input("<CR>")
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
	},
	callback = function()
		vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true })
	end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function(data)
-- 		if vim.fn.argv(0) == "" then
-- 			require("nvim-tree.api").tree.open()
-- 		elseif vim.fn.isdirectory(data.file) == 1 then
-- 			-- change to the directory and open the tree
-- 			vim.cmd.cd(data.file)
-- 			require("nvim-tree.api").tree.open()
-- 		end
-- 	end,
-- })
