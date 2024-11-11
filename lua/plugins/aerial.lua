return {
	"stevearc/aerial.nvim",
	-- lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		layout = {
			placement = "window",
			resize_to_content = false,
			preserve_equality = false,
		},
	},
	config = function(opts)
		require("aerial").setup(opts)
	end,
}
