local M = {}

M.ui = {
	theme = "chadracula",
	transparency = true,

	hl_override = {
		WhichKeyDesc = {
			fg = "purple",
		},
	},

	telescope = { style = "bordered" }, -- borderless / bordered

	statusline = {
		theme = "vscode_colored",
		order = {
			"mode",
			"my_file",
			"diagnostics",
			"git",
			"%=",
			--"lsp_msg", Handled by noice
			"%=",
			"lsp",
			"cursor",
		},
		modules = {
			my_file = function()
				local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
				local path = vim.api.nvim_buf_get_name(buf)

				local parent = vim.loop.cwd() .. "/"
				local rpath = path:gsub(parent, "")

				local utils = require("nvchad.stl.utils")
				local x = utils.file()
				return "%#StText# " .. x[1] .. " " .. rpath .. " "
			end,
		},
	},

	tabufline = {
		lazyload = true,
		order = { "treeOffset", "buffers", "tabs" },
	},

	lsp = { signature = false },

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
