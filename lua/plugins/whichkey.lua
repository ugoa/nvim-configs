return {
	"folke/which-key.nvim",
	keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
	cmd = "WhichKey",
	lazy = false,
	config = function(_, opts)
		dofile(vim.g.base46_cache .. "whichkey")
		vim.o.timeout = true
		vim.o.timeoutlen = 0
		require("which-key").setup(opts)
	end,
}
