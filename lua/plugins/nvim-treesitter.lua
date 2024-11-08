return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	dependencies = {
		-- NOTE: additional parser
		{ "nushell/tree-sitter-nu" },
	},

	config = function()
		pcall(function()
			dofile(vim.g.base46_cache .. "syntax")
			dofile(vim.g.base46_cache .. "treesitter")
		end)

		require("nvim-treesitter.configs").setup({
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
			},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },
		})
	end,
}
