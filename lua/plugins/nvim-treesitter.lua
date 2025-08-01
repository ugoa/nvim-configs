return {
	"nvim-treesitter/nvim-treesitter",
	event = { "VeryLazy" },
	build = ":TSUpdate",
	config = function()
		local opts = {
			ensure_installed = {
				"nu",
				"rust",
				"python",
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
				"toml",
				"make",
			},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },
		}

		-- IMPORTANT to make TS highlight to work.
		-- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/249#issuecomment-2519081718
		require("nvim-treesitter.configs").setup(opts)
	end,
}
