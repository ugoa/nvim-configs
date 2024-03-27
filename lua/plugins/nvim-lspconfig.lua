-- These are some examples, uncomment them if you want to see them work!
return {
	"neovim/nvim-lspconfig",
	config = function()
		local basic = require("nvchad.configs.lspconfig")
		basic.defaults()

		local on_attach = basic.on_attach
		local on_init = basic.on_init
		local capabilities = basic.capabilities

		local lspconfig = require("lspconfig")
		local servers = {
			"pyright",
		}

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
