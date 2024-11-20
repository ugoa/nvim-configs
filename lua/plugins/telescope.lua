return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	cmd = "Telescope",

	opts = {
		defaults = {
			prompt_prefix = "   ",
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--no-ignore",
				"--glob=!.github/*",
				"--glob=!.cargo*",
				"--glob=!.vscode*",
				"--glob=!target*",
				"--glob=!.idea/*",
				"--glob=!.venv/*",
				"--glob=!.git/*",
				"--glob=!log/*",
				"--glob=!logs/*",
				"--glob=!tmp*",
				"--glob=!temp/*",
				"--glob=!.nuxt*",
				"--glob=!node_modules",
				"--glob=!.output*",
				"--glob=!.vinxi/*",
			},

			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
			mappings = {
				n = { ["q"] = require("telescope.actions").close },
			},
		},

		extensions_list = { "themes", "terms" },
		extensions = {},
	},
}
