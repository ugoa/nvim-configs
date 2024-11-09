return {
	{
		"nvchad/ui",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvchad/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	"nvzone/volt",

	"nvzone/menu", -- Pop up menu

	{ "nvzone/minty", cmd = { "Huefy", "Shades" } }, -- Color picker

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			dofile(vim.g.base46_cache .. "devicons")
			return { override = require("nvchad.icons.devicons") }
		end,
	},

	{
		"siduck/showkeys",
		cmd = "ShowkeysToggle",

		opts = {
			-- REF: https://github.com/nvzone/showkeys/blob/main/lua/showkeys/state.lua
			timeout = 2,
			maxkeys = 4,
			show_count = true,
			excluded_modes = { "i" },
		},
	},

	"nvim-lua/plenary.nvim",
}
