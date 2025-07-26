local lsp = function()
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
				Function = { italic = true },
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
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1, -- Displays path relative to cmd
					},
				},
				lualine_x = {
					"encoding",
					"filetype",
					lsp,
				},
			},
		},
	},

	{ "nvim-tree/nvim-web-devicons", opts = {} },

	"nvim-lua/plenary.nvim",
}
