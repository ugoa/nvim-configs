-- Ref https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
local M = {}

local function replace(str, what, with)
	what = string.gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1") -- escape pattern
	with = string.gsub(with, "[%%]", "%%%%") -- escape replacement
	return string.gsub(str, what, with)
end

M.base46 = {
	theme = "bearded-arc",
	transparency = true,

	hl_override = {
		-- https://github.com/NvChad/NvChad/discussions/2722
		["@comment"] = { fg = "teal" }, -- Override treesitter Enabled filetypes
		Comment = { fg = "teal" }, -- Override rest filetypes

		NonText = { fg = "#9dafe3" }, -- Override rest filetypes

		CursorLine = {
			bg = "#4d4f68",
		},
		WhichKeyDesc = {
			fg = "white",
		},
		TbBufOnModified = {
			fg = "red",
		},
		TbBufOnClose = {
			fg = "green",
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
		lazyload = true,
		order = { "treeOffset", "buffers", "tabs" },
	},
}

M.lsp = { signature = false }

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
