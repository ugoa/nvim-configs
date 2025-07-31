return {
	"yetone/avante.nvim",
	enabled = false,
	event = "VeryLazy",
	cmd = "AvanteToggle",
	version = false,
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		"MeanderingProgrammer/render-markdown.nvim",
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	opts = {
		provider = "gemini",
		gemini = {
			model = "gemini-2.0-flash",
		},
		hints = { enabled = false }, -- disable inline keymap hint
		windows = {
			width = 40,
		},
	},

	keys = {
		{
			"<M-a>",
			mode = { "n" },
			"<cmd>AvanteToggle<CR>",
			desc = "Avante",
		},
	},
}
