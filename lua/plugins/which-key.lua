return {
	"folke/which-key.nvim",
	keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	lazy = false,
	config = function(_, opts)
		vim.opt.timeout = true
		vim.opt.timeoutlen = 0
		require("which-key").setup(opts)
	end,
}
