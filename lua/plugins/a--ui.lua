return {
	{
		"nvchad/ui",
		branch = "v3.0",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvchad/base46",
		branch = "v3.0",
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
			return { override = require("nvchad.icons.devicons") }
		end,
	},

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

	"nvim-lua/plenary.nvim",
}
