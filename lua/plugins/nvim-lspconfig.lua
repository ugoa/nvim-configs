return {
	"neovim/nvim-lspconfig",
	config = function()
		local nvchad = require("nvchad.configs.lspconfig")
		nvchad.defaults() -- This setup the Lua LSP by Nvchad.

		local servers = {

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua
			pyright = {},

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/volar.lua
			volar = {
				init_options = {
					vue = {
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
					},
				},
			},

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tsserver.lua
			tsserver = {},

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/rust_analyzer.lua
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
