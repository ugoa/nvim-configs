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

local function minifiles_toggle()
	local MiniFiles = require("mini.files")
	if not MiniFiles.close() then
		local buf_name = vim.api.nvim_buf_get_name(0)
		local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
		MiniFiles.open(path)
		MiniFiles.reveal_cwd()
	end
end

local section_opts = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = { { "filename", path = 1, on_click = minifiles_toggle } },
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
}

return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			custom_highlights = {
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
					themable = true,
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
					statusline = { "aerial", "checkhealth", "help" },
					winbar = { "aerial", "checkhealth", "help" },
				},
			},
			sections = section_opts,
			inactive_sections = section_opts,
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
				go_out = "H",
				go_out_plus = "h",
			},
		},
		keys = {
			{ "-", minifiles_toggle, desc = "Open Mini Files" },
		},
	},
}
