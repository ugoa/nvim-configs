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

		lspconfig.pyright.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		})

		lspconfig.volar.setup({
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
