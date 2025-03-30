return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
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
	},
	opts = {
		provider = "deepseek",
		hints = { enabled = false }, -- disable inline keymap hint
		vendors = {
			deepseek = {
				__inherited_from = "openai",
				api_key_name = "LLM_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-coder",
				max_tokens = 8192,
			},
		},
		windows = {
			width = 40,
		},
	},
}
