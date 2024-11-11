return {
	"stevearc/aerial.nvim",
	cmd = { "AerialToggle" },
	enabled = false,
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		layout = {
			min_width = 20,

			placement = "window",
			resize_to_content = false,
			preserve_equality = false,
		},
	},
	config = function(opts)
		require("aerial").setup(opts)
	end,
}
