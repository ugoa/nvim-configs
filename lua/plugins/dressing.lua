return {
	"stevearc/dressing.nvim",
	lazy = false, -- load first before nui.nvim hiject the vim.ui.select event
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
