-- Ref https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
local M = {}

local function replace(str, what, with)
	what = string.gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1") -- escape pattern
	with = string.gsub(with, "[%%]", "%%%%") -- escape replacement
	return string.gsub(str, what, with)
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
}

local base_16 = {
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

M.base46 = {
	theme = "chadracula",
	transparency = false,

	hl_override = {

		-- https://github.com/nvim-tree/nvim-tree.lua/issues/2923
		NvimTreeCursorLine = { bg = colors.lightbg },

		["@keyword"] = { italic = true },
		["@keyword.function"] = { italic = true },
		["@keyword.return"] = { italic = true },
		["@keyword.conditional"] = { italic = true },
		["@keyword.operator"] = { italic = true },
		["@keyword.repeat"] = { italic = true },

		["@operator"] = { italic = true },

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
		Function = { italic = true },

		-- https://github.com/NvChad/NvChad/discussions/2722
		["@comment"] = { fg = colors.teal }, -- Override treesitter Enabled filetypes
		Comment = { fg = colors.teal }, -- Override rest filetypes
		NonText = { fg = base_16.base03 }, -- such as git blame virtual line info

		WhichKeyDesc = {
			fg = colors.white,
		},

		-- bufferline button color
		TbBufOnModified = {
			fg = colors.red,
		},
		TbFill = {
			bg = colors.black,
		},
		TbBufOnClose = {
			fg = colors.green,
		},
	},
}

M.ui = {
	telescope = { style = "bordered" }, -- borderless / bordered

	statusline = {
		theme = "vscode_colored",
		order = {
			"my_file",
			"diagnostics",
			"git",
			"%=",
			--"lsp_msg", Handled by noice
			"%=",
			"cursor",
			"percent",
			"mode",
			"lsp",
		},
		modules = {
			my_file = function()
				local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
				local path = vim.api.nvim_buf_get_name(buf)

				local parent = vim.loop.cwd() .. "/"
				local rpath = replace(path, parent, "")

				local utils = require("nvchad.stl.utils")
				local x = utils.file()
				if rpath == "NvimTree_1" then
					return ""
				else
					return " " .. rpath .. " (" .. x[1] .. " " .. vim.bo.filetype .. ")"
				end
			end,

			percent = function()
				return "%#St_pos_sep#" .. " " .. "%#St_pos_icon#%#St_pos_text# %p%% "
			end,
			ftp = function()
				return " " .. vim.bo.filetype
			end,
		},
	},

	tabufline = {
		order = { "treeOffset", "buffers" },
	},
	cmp = {
		lspkind_text = true,
		style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = true,
		},
	},
}

M.lsp = { signature = true }

M.term = {
	float = {
		relative = "editor",
		row = 0.05,
		col = 0.1,
		width = 0.8,
		height = 0.8,
		border = "single",
	},
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", M, status and chadrc or {})
