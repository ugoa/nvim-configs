return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	dependencies = "neovim/nvim-lspconfig",
	config = function()
		local config = require("nvchad.configs.lspconfig")

		local on_attach = config.on_attach
		local capabilities = config.capabilities

		local options = {
			server = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		}

		require("rust-tools").setup(options)
	end,
}
