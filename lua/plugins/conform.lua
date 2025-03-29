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
			html = { "djlint" },
			htmldjango = { "djlint" },
		},
		format_on_save = { -- These options will be passed to conform.format()
			timeout_ms = 10000, -- increase timeout to 2s since black take longer time to finish.
			lsp_fallback = true,
		},
	},

	config = function(_, opts)
		require("conform").setup(opts)

		require("conform").formatters.djlint = function(bufnr)
			return {
				command = "djlint",
				args = { "--reformat", "-" },
				cwd = require("conform.util").root_file({ "djlint.toml" }),
			}
		end
	end,
}
