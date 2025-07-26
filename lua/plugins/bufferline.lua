return {
	"akinsho/bufferline.nvim",
	lazy = false,
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	after = "catppuccin",
	config = function(_, opts)
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
	end,
}
