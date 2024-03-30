return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
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
				"--glob=!.cargo/*",
				"--glob=!.vscode/*",
				"--glob=!target/*",
				"--glob=!.idea/*",
				"--glob=!.venv/*",
				"--glob=!.git/*",
				"--glob=!log/*",
				"--glob=!logs/*",
				"--glob=!tmp/*",
				"--glob=!temp/*",
			},
			-- sorting_strategy = "descending",
			-- layout_config = {
			-- 	horizontal = {
			-- 		prompt_position = "bottom",
			-- 	},
			-- },
		},
	},
}
