return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		git = { enable = true },
		filters = {
			dotfiles = false,
		},
		renderer = {
			root_folder_label = ":~:s?$?",
			highlight_opened_files = "all",
		},
		view = {
			adaptive_size = true,
			width = {
				max = "40%",
			},
		},
	},
}
