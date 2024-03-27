return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"rust-analyzer",
			"pyright",
			"terraform-ls",
			"lua-language-server",
			"black",
			"stylua",
		},
	},
}
