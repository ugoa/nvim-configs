local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>la", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = "LSP code Action" })

vim.keymap.set("n", "<leader>le", function()
	vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "Expand Rust Macro" })

local nvchad = require("nvchad.configs.lspconfig")
nvchad.on_attach(bufnr) -- This setup the Lua LSP by Nvchad.
