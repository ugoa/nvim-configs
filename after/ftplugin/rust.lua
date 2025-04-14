local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>grv", function()
	vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "Lsp: Expand Rust Macro" })

vim.g.rustaceanvim = {
	server = {
		default_settings = {
			["rust-analyzer"] = {
				rustfmt = {
					extraArgs = { "+nightly" },
				},
				files = {
					excludeDirs = {
						"node_modules",
					},
				},
				cargo = {
					features = "all",
				},
			},
		},
	},
}
