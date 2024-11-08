return {
	 {
	 	"NvChad/NvChad",
	 	lazy = false,
	 	branch = "v2.5",
	 	config = function()
	 		require("options")
	 	end,
	 },

	{
		"nvchad/base46",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"nvchad/ui",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},
}
