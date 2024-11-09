local M = {}

-- export on_attach & capabilities
M.on_attach = function(client, _bufnr)
	-- Disable format on save.
	-- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
	client.server_capabilities.documentFormattingProvider = false
end

M.on_init = function(client, _bufnr)
	-- disable semanticTokens
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end

	-- Disable LSP syntax highlighting, and use treesitter instead, which is much prettier.
	-- Ref: https://github.com/NvChad/NvChad/issues/1907
	client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
	textDocument = {
		completion = {
			completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			},
		},
	},
})

local Servers = {
	tailwindcss = {},

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
						"${3rd}/luv/library",
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	},

	-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua
	pyright = {}, -- Python

	-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tsserver.lua
	tsserver = {}, -- Typescript

	-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/rust_analyzer.lua
	-- rust_analyzer = {
	-- 	on_attach = function(client, bufnr)
	-- 		M.on_attach(client, bufnr)
	--
	-- 		local expand_macro = function()
	-- 			local error_handler = nil
	-- 			client.request("expandMacro", vim.lsp.util.make_position_params(), error_handler, bufnr)
	-- 		end
	-- 		vim.keymap.set("n", "<leader>le", expand_macro, { buffer = bufnr, desc = "Expand Macro" })
	-- 	end,
	-- },

	-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/volar.lua
	-- https://github.com/williamboman/mason-lspconfig.nvim/issues/371
	-- volar = { -- Vue.js
	-- 	init_options = {
	-- 		vue = {
	-- 			hybridMode = false,
	-- 		},
	-- 		typescript = {
	-- 			tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
	-- 		},
	-- 	},
	-- },
}

return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",

	config = function()
		dofile(vim.g.base46_cache .. "lsp")
		require("nvchad.lsp").diagnostic_config()

		for name, overrides in pairs(Servers) do
			require("lspconfig")[name].setup(vim.tbl_deep_extend("force", M, overrides))
		end
	end,
}
