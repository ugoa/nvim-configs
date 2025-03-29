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
