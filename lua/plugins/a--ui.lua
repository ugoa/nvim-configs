return {
	{
		"nvchad/base46",
		branch = "v2.5",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"nvchad/ui",
		lazy = false,
		branch = "v2.5",
		config = function()
			require("nvchad")
		end,
	},
}
