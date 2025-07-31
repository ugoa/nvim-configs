return {
	"olimorris/codecompanion.nvim",
	keys = {
		{
			"<M-a>",
			"<cmd>CodeCompanionChat Toggle<CR>",
		},
	},
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
	},
}
