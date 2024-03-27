-- These are some examples, uncomment them if you want to see them work!
return {
	"neovim/nvim-lspconfig",
	config = function()
		require("nvchad.configs.lspconfig").defaults()

		local on_attach = require("nvchad.configs.lspconfig").on_attach
		local on_init = require("nvchad.configs.lspconfig").on_init
		local capabilities = require("nvchad.configs.lspconfig").capabilities

		local lspconfig = require("lspconfig")
		local servers = { "pyright" }

		-- lsps with default config
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				on_init = on_init,
				capabilities = capabilities,
			})
		end
	end,
}
