local function lsp()
	if rawget(vim, "lsp") then
		for _, client in ipairs(vim.lsp.get_clients()) do
			local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
			if client.attached_buffers[stbufnr] then
				return (vim.o.columns > 100 and "  LSP: " .. client.name .. " ") or "   LSP "
			end
		end
	end
	return ""
end

local colors = {
	white = "#F8F8F2",
	darker_black = "#222430",
	black = "#282A36", --  nvim bg
	black2 = "#2d303e",
	one_bg = "#373844", -- real bg of onedark
	one_bg2 = "#44475a",
	one_bg3 = "#565761",
	grey = "#5e5f69",
	grey_fg = "#666771",
	grey_fg2 = "#6e6f79",
	light_grey = "#73747e",
	red = "#ff7070",
	baby_pink = "#ff86d3",
	pink = "#FF79C6",
	line = "#3c3d49", -- for lines like vertsplit
	green = "#50fa7b",
	vibrant_green = "#5dff88",
	nord_blue = "#8b9bcd",
	blue = "#a1b1e3",
	yellow = "#F1FA8C",
	sun = "#FFFFA5",
	purple = "#BD93F9",
	dark_purple = "#BD93F9",
	teal = "#92a2d4",
	orange = "#FFB86C",
	cyan = "#8BE9FD",
	statusline_bg = "#2d2f3b",
	lightbg = "#41434f",
	pmenu_bg = "#b389ef",
	folder_bg = "#BD93F9",
	-- base16
	base00 = "#282936",
	base01 = "#3a3c4e",
	base02 = "#4d4f68",
	base03 = "#626483",
	base04 = "#62d6e8",
	base05 = "#e9e9f4",
	base06 = "#f1f2f8",
	base07 = "#f7f7fb",
	base08 = "#c197fd",
	base09 = "#FFB86C",
	base0A = "#62d6e8",
	base0B = "#F1FA8C",
	base0C = "#8BE9FD",
	base0D = "#50fa7b",
	base0E = "#ff86d3",
	base0F = "#F8F8F2",
}

return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
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
				GitSignsCurrentLineBlame = { fg = colors.light_grey },

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
	},

	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		after = "catppuccin",
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
						"undefined",
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
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{ "location", separator = "" },
					{ "progress", separator = "" },
					{
						function()
							return vim.fn.line("$") .. "L"
						end,
					},
				},
				lualine_y = { lsp },
				lualine_z = { "filetype" },
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
	{
		"echasnovski/mini.files",
		version = "*",
		opts = {
			windows = {
				preview = true,
				width_nofocus = 20,
				width_focus = 40,
				width_preview = 60,
			},
			mappings = {
				close = "<ESC>",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "h",
				go_out_plus = "h",
			},
		},
		config = function(_, opts)
			local MiniFiles = require("mini.files")
			MiniFiles.setup(opts)

			local function up_till_root()
				local p = require("mini.files").get_fs_entry().path
				local parent = vim.fs.dirname(p)
				-- https://github.com/echasnovski/mini.files/blob/main/lua/mini/files.lua#L2143-L2145
				if parent ~= vim.fn.getcwd() then
					for _ = 1, vim.v.count1 do
						MiniFiles.go_out()
						-- MiniFiles.trim_right()
					end
				end
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					vim.keymap.set("n", "h", up_till_root, { buffer = buf_id })
				end,
			})
		end,

		keys = {
			{
				"-",
				function()
					local MiniFiles = require("mini.files")
					if not MiniFiles.close() then
						local buf_name = vim.api.nvim_buf_get_name(0)
						local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
						MiniFiles.open(path)
						MiniFiles.reveal_cwd()
					end
				end,
				desc = "Open Mini Files",
			},
		},
	},

	{ "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle", opts = {} },

	{
		"lewis6991/gitsigns.nvim",
		cmd = "Gitsigns",
		lazy = false,
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
