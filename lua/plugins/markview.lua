return {
	"OXY2DEV/markview.nvim",
	tag = "v25.3.0",
	ft = "markdown",
	lazy = false,

	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },

	opts = {
		initial_state = false,
		preview = {
			icon_provider = "devicons",
		},
	},
}
