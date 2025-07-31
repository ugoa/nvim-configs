return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			-- json = { "prettier" },
			-- vue = { "prettier" },
			html = { "djlint" },
			htmldjango = { "djlint" },
		},
		format_on_save = function(bufnr)
			local filetype = vim.bo[bufnr].filetype
			if filetype ~= "html" and filetype ~= "htmldjango" then
				return {
					timeout_ms = 10000,
					lsp_fallback = true,
				}
			end
			return nil
		end,
	},

	config = function(_, opts)
		require("conform").setup(opts)

		require("conform").formatters.djlint = function(_bufnr)
			return {
				command = "djlint",
				-- args = { "--format-js", "--format-css", "--reformat", "-" },
				args = { "--reformat", "-" },
				cwd = require("conform.util").root_file({ "djlint.toml" }),
			}
		end
	end,
}
