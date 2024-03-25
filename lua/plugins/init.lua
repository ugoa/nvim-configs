return {

  { "alexghergh/nvim-tmux-navigation" },

	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			filters = {
				dotfiles = false,
			},
			renderer = {
				root_folder_label = ":~:s?$?",
				highlight_opened_files = "all",
			},
			view = {
				adaptive_size = true,
				width = {
					max = "35%",
				},
			},
		},
	},

	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/.nvim_sessions" },
		},
	},

	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	ft = { "python", "lua" },
	-- 	opts = function()
	-- 		return require("configs.none-ls")
	-- 	end,
	-- },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 0,
				ignore_whitespace = false,
				virt_text_priority = 700,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig")
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"rust-analyzer",
				"pyright",
				"terraform-ls",
				"lua-language-server",
				"black",
				"stylua",
				-- "ruff-lsp",
			},
		},
	},

	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"rust",
			},
		},
	},

	{
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
			},
		},
	},

	{ "NvChad/nvterm", enabled = false },

	{ "NvChad/nvim-colorizer.lua", enabled = false },
}
