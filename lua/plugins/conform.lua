return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			-- vue = { "prettier" },
			-- html = { "djlint" },
		},
		format_on_save = { -- These options will be passed to conform.format()
			timeout_ms = 4000, -- increase timeout to 2s since black take longer time to finish.
			lsp_fallback = true,
		},
	},
}
