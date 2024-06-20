return {
	"neovim/nvim-lspconfig",
	config = function()
		local nvchad = require("nvchad.configs.lspconfig")
		nvchad.defaults() -- This setup the Lua LSP by Nvchad.

		local common = {

			on_init = function(client, _)
				-- Disable LSP syntax highlighting.
				-- Ref: https://github.com/NvChad/NvChad/issues/1907
				client.server_capabilities.semanticTokensProvider = nil
			end,

			on_attach = function(client, bufnr)
				nvchad.on_attach(client, bufnr)
				-- Disable format on save.
				-- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
				client.server_capabilities.documentFormattingProvider = false
			end,
			capabilities = nvchad.capabilities,
		}

		local servers = {

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua
			pyright = {}, -- Python

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tsserver.lua
			tsserver = {}, -- Typescript

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/rust_analyzer.lua
			rust_analyzer = { -- Rust
				on_attach = nvchad.on_attach,
			},

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/volar.lua
			-- https://github.com/williamboman/mason-lspconfig.nvim/issues/371
			volar = { -- Vue.js
				init_options = {
					vue = {
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
					},
				},
			},
		}

		for name, overrides in pairs(servers) do
			require("lspconfig")[name].setup(vim.tbl_deep_extend("force", common, overrides))
		end
	end,
}
