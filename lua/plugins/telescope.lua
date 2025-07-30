local function focus_preview(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local picker = action_state.get_current_picker(prompt_bufnr)
	local prompt_win = picker.prompt_win
	local previewer = picker.previewer
	local bufnr = previewer.state.bufnr or previewer.state.termopen_bufnr
	local winid = previewer.state.winid or vim.fn.win_findbuf(bufnr)[1]
	vim.keymap.set("n", "<Tab>", function()
		vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
	end, { buffer = bufnr })
	vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
	-- api.nvim_set_current_win(winid)
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",

	keys = {
		{
			"<M-f>",
			mode = { "n" },
			function()
				require("telescope.builtin").find_files({
					find_command = {
						"rg",
						"--files",
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
						"--glob=!node_modules/*",
						"--glob=!.output*",
						"--glob=!.vinxi/*",
						"--glob=!__pycache__/*",
						"--glob=!dist/*",
						"--glob=!db-data/*",
						"--glob=!.bsp/*",
						"--glob=!.DS_Store",
						"--glob=!project/*/*",
					},
				})
			end,
			desc = "find files",
		},
	},

	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--trim",
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
				"--glob=!node_modules/*",
				"--glob=!.output*",
				"--glob=!.vinxi/*",
				"--glob=!__pycache__/*",
				"--glob=!dist/*",
				"--glob=!db-data/*",
				"--glob=!.bsp/*",
				"--glob=!.DS_Store",
				"--glob=!project/**/*",
			},

			prompt_prefix = "   ",

			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.85,
				height = 0.80,
			},
			mappings = {
				i = {
					["<Esc>"] = require("telescope.actions").close,
				},
			},
		},

		extensions_list = { "themes", "terms" },
		extensions = {},
	},
}
