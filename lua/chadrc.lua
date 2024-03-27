local M = {}

M.ui = {
	theme = "catppuccin",
	transparency = false,

	statusline = {
		theme = "vscode_colored",
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
