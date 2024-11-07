return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		local options = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				-- vue = { "prettier" },
				html = { "djlint" },
				htmldjango = { "djlint" },
			},
			format_on_save = { -- These options will be passed to conform.format()
				timeout_ms = 2000, -- increase timeout to 2s since black take longer time to finish.
				lsp_fallback = true,
			},
		}
		require("conform").setup(options)
	end,
}
