return {
	{
		"siduck/showkeys",
		cmd = "ShowkeysToggle",
		opts = {
			-- REF: https://github.com/nvzone/showkeys/blob/main/lua/showkeys/state.lua
			timeout = 2,
			maxkeys = 2,
			show_count = true,
			position = "bottom-left",
			excluded_modes = { "i", "t" },
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"sphamba/smear-cursor.nvim",
		cmd = { "SmearCursorToggle" },
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		opts = {},
		config = function(_, opts)
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		lazy = false,
		config = function(_, opts)
			vim.opt.timeout = true
			vim.opt.timeoutlen = 0
			require("which-key").setup(opts)
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		lazy = false,
		config = function(_, opts)
			vim.opt.timeout = true
			vim.opt.timeoutlen = 0
			require("which-key").setup(opts)
		end,
	},

	{
		"razak17/tailwind-fold.nvim",
		enabled = false,
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "vue", "jsx", "tsx", "htmldjango" },
	},

	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle" }, -- for code outline
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			keymaps = {
				["<CR>"] = "actions.scroll",
				["p"] = "actions.jump",
			},
			layout = {
				max_width = { 60, 0.4 },
				min_width = 30,
			},
		},
	},

	{
		"mrcjkb/rustaceanvim",
		lazy = false, -- This plugin is already lazy
		version = "^6", -- Recommended
	},

	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			popup = {
				autofocus = true,
				border = "rounded",
			},
			completion = {
				crates = {
					enabled = true,
					max_results = 8, -- The maximum number of search results to display
					min_chars = 3, -- The minimum number of charaters to type before completions begin appeari
				},
				cmp = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},

	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			log_level = "error",
		},
	},
	{
		{
			"linrongbin16/gitlinker.nvim",
			cmd = "GitLink",
			opts = {
				router = {
					browse = {
						["gitlab.myteksi.net"] = "https://gitlab.myteksi.net/"
							.. "{_A.ORG}/"
							.. "{_A.REPO}/blob/"
							.. "{_A.REV}/"
							.. "{_A.FILE}"
							.. "#L{_A.LSTART}"
							.. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
					},
				},
			},
		},
	},

	{
		"NeogitOrg/neogit",
		tag = "v2.0.0",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},

	{
		"LintaoAmons/bookmarks.nvim",
		tag = "3.2.0",
		opts = {},
		dependencies = {
			{ "kkharji/sqlite.lua" },
			{ "nvim-telescope/telescope.nvim" },
		},
		keys = {
			{ "mm", "<cmd>BookmarksMark<cr>", desc = "Open Mini Files" },
			{
				"md",
				function()
					require("bookmarks.commands").delete_mark_of_current_file()
				end,
				desc = "Delete bookmark at current line",
			},
			{ "mo", "<cmd>BookmarksGoto<cr>", desc = "Go to bookmark at current active BookmarkList" },
			{ "ma", "<cmd>BookmarksCommands<cr>", desc = "Find and trigger a bookmark command." },
		},
	},
}
