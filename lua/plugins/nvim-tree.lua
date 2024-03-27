return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		git = { enable = true },
		filters = {
			dotfiles = true,
		},
		renderer = {
			root_folder_label = ":~:s?$?",
			highlight_opened_files = "all",
			icons = {
				git_placement = "signcolumn",
				modified_placement = "signcolumn",
			},
		},
		view = {
			adaptive_size = true,
			signcolumn = "auto",
			width = {
				max = "40%",
			},
		},
	},
}
