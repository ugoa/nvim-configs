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
			"toml",
			"make",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
	-- IMPORTANT to make TS highlight to work.
	-- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/249#issuecomment-2519081718
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
