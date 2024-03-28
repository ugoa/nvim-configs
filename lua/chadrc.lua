local M = {}

M.ui = {
	theme = "catppuccin",
	transparency = false,

	statusline = {
		theme = "vscode_colored",
		order = { "mode", "myfile", "diagnostics", "git", "%=", "lsp_msg", "%=", "lsp", "cursor", "cwd" },
		modules = {
			myfile = function()
				local path = vim.fn.expand("%")
				local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
				local path1 = vim.api.nvim_buf_get_name(buf)
				local utils = require("nvchad.stl.utils")
				local x = utils.file()
				local name = " " .. path .. " "
				return "%#StText# " .. x[1] .. name
			end,
		},
	},
	term = {
		float = {
			relative = "editor",
			row = 0.05,
			col = 0.1,
			width = 0.8,
			height = 0.8,
			border = "single",
		},
	},
}

return M
