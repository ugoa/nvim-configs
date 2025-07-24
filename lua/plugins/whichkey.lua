return {
	"folke/which-key.nvim",
	keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	cmd = "WhichKey",
	lazy = false,
	opts = {
		win = {
			border = "single",
		},
	},
	config = function(_, opts)
		vim.o.timeout = true
		vim.o.timeoutlen = 0
		require("which-key").setup(opts)
	end,
}
