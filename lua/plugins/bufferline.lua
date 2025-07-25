return {
	"akinsho/bufferline.nvim",
	lazy = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function(_, opts)
		require("bufferline").setup({
			options = {},
			highlights = require("catppuccin.groups.integrations.bufferline").get({}),
		})
	end,
}
