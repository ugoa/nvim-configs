-- These are some examples, uncomment them if you want to see them work!
return {
	"neovim/nvim-lspconfig",
	config = function()
		local basic = require("nvchad.configs.lspconfig")
		basic.defaults()

		local lspconfig = require("lspconfig")

		lspconfig.pyright.setup({
			on_attach = basic.on_attach,
			on_init = basic.on_init,
			capabilities = basic.capabilities,
		})

		lspconfig.volar.setup({
			-- Disable volar formatting, use eslint and prettier instread
			on_attach = function(client, bufnr)
				basic.on_attach(client, bufnr)
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
				-- Use prettier instead of volar lsp to do formatting
				client.server_capabilities.documentFormattingProvider = false
			end,
			filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
			init_options = {
				vue = {
					hybridMode = false,
				},
				typescript = {
					tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
				},
			},
		})
	end,
}
