return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-mocha",
			},

			sections = {
				lualine_c = {
					{
						"filename",
						path = 1, -- Displays path relative to cmd
					},
				},
			},
		})
	end,
}
