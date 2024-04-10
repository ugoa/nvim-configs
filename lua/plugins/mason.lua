return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"rust-analyzer",
			-- for python
			"pyright",
			"black",
			-- for lua
			"lua-language-server",
			"stylua",
			-- for vue.js
			"vue-language-server",
		},
	},
}
