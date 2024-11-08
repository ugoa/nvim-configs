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

	"nvzone/menu",

	{ "nvzone/minty", cmd = { "Huefy", "Shades" } },

	"nvim-lua/plenary.nvim",
}
