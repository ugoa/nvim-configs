return {
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
}
