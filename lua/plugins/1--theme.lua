return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			auto_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = {
					enabled = true,
					transparent = false,
				},
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
			custom_highlights = {
				GitSignsCurrentLineBlame = { fg = "#73747e" },

				BookMarksAdd = { fg = "#73747e" },
				BookMarksAnn = { fg = "#73747e" },

				["@keyword"] = { italic = true },
				["@keyword.function"] = { italic = true },
				["@keyword.return"] = { italic = true },
				["@keyword.conditional"] = { italic = true },
				["@keyword.operator"] = { italic = true },
				["@keyword.repeat"] = { italic = true },
				["@variable.builtin"] = { italic = true },
				["@variable.repeat"] = { italic = true },
				["@variable.conditional"] = { italic = true },
				["@variable.operator"] = { italic = true },

				["@constant.builtin"] = { italic = true },
				["@type.builtin"] = { italic = true },

				Keyword = { italic = true },
				Include = { italic = true },
				Boolean = { italic = true },
				Statement = { italic = true },
				Conditional = { italic = true },
				Repeat = { italic = true },
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd([[colorscheme catppuccin]])
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		after = "catppuccin",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					themable = true, -- allow override by themes
					separator_style = "slant",
					truncate_names = false,
				},
				highlights = require("catppuccin.groups.integrations.bufferline").get({ styles = { "bold" } }),
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		after = "catppuccin",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "catppuccin",
				disabled_filetypes = {
					statusline = {
						"minifiles",
						"TelescopePrompt",
						"NvTerm_float",
						"neo-tree",
						"aerial",
						"checkhealth",
						"NvTerm_vsp",
						"NvTerm_sp",
						"checkhealth",
						"fugitive*",
						"git",
						"lspinfo",
						"netrw",
						"notify",
						"query",
						"vim",
						"Avante",
						"grug-far",
					},
					winbar = { "aerial", "checkhealth", "help" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 }, "filetype" },
				lualine_x = {
					{ "progress", separator = "" },
					{ "location", separator = "" },
					{
						function()
							return vim.fn.line("$") .. "L"
						end,
						separator = "",
					},
				},
				lualine_y = {
					{
						-- show total buffer numbers
						function()
							local count = 0
							for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
								if vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) then
									count = count + 1
								end
							end
							return " " .. count
						end,
					},
					{
						-- show lsp_client
						function()
							if rawget(vim, "lsp") then
								for _, client in ipairs(vim.lsp.get_clients()) do
									local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
									if client.attached_buffers[stbufnr] then
										return "  " .. client.name
									end
								end
							end
							return ""
						end,
					},
				},
				lualine_z = {
					{
						function()
							-- return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
							local cwd = vim.fn.getcwd()
							local home_dir = vim.fn.expand("~")

							if string.find(cwd, home_dir, 1, true) == 1 then
								-- CWD is within the home directory, so remove the home_dir prefix
								local relative_path = string.sub(cwd, string.len(home_dir) + 2)
								if relative_path == "" then
									-- If CWD is exactly the home directory, the relative path is "."
									relative_path = "."
								end
								return "~/" .. relative_path
							else
								-- CWD is outside the home directory, so the relative path is just the CWD
								return cwd
							end
						end,
					},
				},
			},
			inactive_sections = {
				lualine_c = { { "filename", path = 1 } },
			},
		},
	},

	{ "nvim-tree/nvim-web-devicons", opts = {} },

	"nvim-lua/plenary.nvim",

	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				enabled = true,
			},
			select = {
				enabled = true,
				backend = { "telescope", "builtin" },
				telescope = require("telescope.themes").get_cursor(),
			},
		},
	},

	{ "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle", opts = {} },

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",

		opts = {
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 0,
				ignore_whitespace = true,
				virt_text_priority = 700,
			},
			signs = {
				delete = { text = "󰍵" },
				changedelete = { text = "󱕖" },
			},
		},
	},
}
