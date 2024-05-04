-- These are some examples, uncomment them if you want to see them work!
return {
	"neovim/nvim-lspconfig",
	config = function()
		local servers = {

			pyright = {},

			volar = {
				filetypes = { "vue" },
				init_options = {
					vue = {
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
					},
				},
			},

			tsserver = {
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
			},
		}

		local nvchad_lsp = require("nvchad.configs.lspconfig")
		nvchad_lsp.defaults()

		local common_options = {
			on_init = nvchad_lsp.on_init,
			on_attach = function(client, bufnr)
				nvchad_lsp.on_attach(client, bufnr)
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
				client.server_capabilities.documentFormattingProvider = false
			end,
			capabilities = nvchad_lsp.capabilities,
		}

		for name, options in pairs(servers) do
			local server = require("lspconfig")[name]
			server.setup(vim.tbl_deep_extend("force", common_options, options))
		end
	end,
}
