local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
	-- map("n", "<leader>ra", vim.lsp.buf.rename, opts("NvRenamer"))
	map("n", "<leader>ra", require("nvchad.lsp.renamer"), opts("NvRenamer"))

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	map("n", "gr", vim.lsp.buf.references, opts("Show references"))
end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
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
}

M.defaults = function()
	dofile(vim.g.base46_cache .. "lsp")
	require("nvchad.lsp").diagnostic_config()

	require("lspconfig").lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,

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
	})
end

return {
	"neovim/nvim-lspconfig",
	event = "User FilePost",

	config = function()
		local nvchad = M
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
			-- rust_analyzer = {
			-- 	on_attach = function(client, bufnr)
			-- 		nvchad.on_attach(client, bufnr)
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
