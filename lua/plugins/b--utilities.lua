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
		lazy = false,
		config = function(_, opts)
			vim.opt.timeout = true
			vim.opt.timeoutlen = 0
			require("which-key").setup(opts)
		end,
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
			layout = {
				default_direction = "prefer_left",
				max_width = { 100, 0.4 },
				min_width = 40,
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
		"MagicDuck/grug-far.nvim",
		event = "VeryLazy",
		opts = {
			engines = {
				ripgrep = {
					defaults = {
						flags = "-i",
					},
				},
			},
		},
	},

	{

		"tomasky/bookmarks.nvim",
		event = "VimEnter",
		after = "telescope.nvim",
		config = function()
			require("bookmarks").setup({

				-- sign_priority = 8,  --set bookmark sign priority to cover other sign
				save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
				on_attach = function(bufnr)
					local bm = require("bookmarks")
					local map = vim.keymap.set
					map("n", "mm", bm.bookmark_ann) -- add or edit mark annotation at current line
					map("n", "mi", bm.bookmark_toggle) -- add or remove bookmark at current line
					map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
					map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
					map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
					map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
					map("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
				end,
			})
			require("telescope").load_extension("bookmarks")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				-- json = { "prettier" },
				-- vue = { "prettier" },
				html = { "djlint" },
				htmldjango = { "djlint" },
			},
			format_on_save = function(bufnr)
				local filetype = vim.bo[bufnr].filetype
				if filetype ~= "html" and filetype ~= "htmldjango" then
					return {
						timeout_ms = 10000,
						lsp_fallback = true,
					}
				end
				return nil
			end,
		},

		config = function(_, opts)
			require("conform").setup(opts)

			require("conform").formatters.djlint = function(_bufnr)
				return {
					command = "djlint",
					-- args = { "--format-js", "--format-css", "--reformat", "-" },
					args = { "--reformat", "-" },
					cwd = require("conform.util").root_file({ "djlint.toml" }),
				}
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall" },

		opts = {
			ensure_installed = {
				"rust-analyzer", -- for rust
				"pyright", -- for python
				"lua-language-server", -- for lua
				"stylua",
			},
			PATH = "skip",

			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
			max_concurrent_installers = 10,
		},
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				-- json = { "prettier" },
				-- vue = { "prettier" },
				html = { "djlint" },
				htmldjango = { "djlint" },
			},
			format_on_save = function(bufnr)
				local filetype = vim.bo[bufnr].filetype
				if filetype ~= "html" and filetype ~= "htmldjango" then
					return {
						timeout_ms = 10000,
						lsp_fallback = true,
					}
				end
				return nil
			end,
		},

		config = function(_, opts)
			require("conform").setup(opts)

			require("conform").formatters.djlint = function(_bufnr)
				return {
					command = "djlint",
					-- args = { "--format-js", "--format-css", "--reformat", "-" },
					args = { "--reformat", "-" },
					cwd = require("conform.util").root_file({ "djlint.toml" }),
				}
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall" },

		opts = {
			ensure_installed = {
				"rust-analyzer", -- for rust
				"pyright", -- for python
				"lua-language-server", -- for lua
				"stylua",
			},
			PATH = "skip",

			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
			max_concurrent_installers = 10,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local opts = {
				ensure_installed = {
					"nu",
					"rust",
					"python",
					"yaml",
					"bash",
					"regex",
					"markdown",
					"markdown_inline",
					"vue",
					"javascript", -- jsx included
					"typescript",
					"tsx",
					"html",
					"css",
					"scss",
					"terraform",
					"just",
					"htmldjango",
					"json",
					"sql",
					"java",
					"scala",
					"toml",
					"make",
				},
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = { enable = true },
			}

			-- IMPORTANT to make TS highlight to work.
			-- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/249#issuecomment-2519081718
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
