return {
	"neovim/nvim-lspconfig",
	config = function()
		local nvchad = require("nvchad.configs.lspconfig")
		nvchad.defaults() -- This setup the Lua LSP by Nvchad.

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

			rust_analyzer = {},
		}

		local common = {
			-- https://github.com/NvChad/NvChad/issues/1907
			on_init = function(client, _)
				client.server_capabilities.semanticTokensProvider = nil
			end,
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
			on_attach = function(client, bufnr)
				nvchad.on_attach(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
			end,
			capabilities = nvchad.capabilities,
		}
		for name, opts in pairs(servers) do
			require("lspconfig")[name].setup(vim.tbl_deep_extend("force", common, opts))
		end
	end,
}
