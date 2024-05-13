return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"rust",
			"yaml",
			"bash",
			"regex",
			"markdown",
			"markdown_inline",
			"vue",
			"javascript", -- jsx included
			"typescript",
			"tsx",
			"html",
			"css",
			"scss",
			"terraform",
		},
	},
}
