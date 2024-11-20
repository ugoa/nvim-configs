return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	dependencies = {
		-- NOTE: additional parser
		{ "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
	},
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
			"just",
			"htmldjango",
			"json",
			"sql",
			"java",
			"scala",
			"nu",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
}
