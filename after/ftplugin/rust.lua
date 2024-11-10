local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>v", function()
	vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "Expand Rust Macro" })

vim.g.rustaceanvim = {
	server = {
		default_settings = {
			["rust-analyzer"] = {
				files = {
					excludeDirs = {
						"node_modules",
					},
				},
			},
		},
	},
}
