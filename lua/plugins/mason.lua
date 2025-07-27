return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall" },

	opts = {
		ensure_installed = {
			"rust-analyzer", -- for rust
			"pyright", -- for python
			"lua-language-server", -- for lua
		},
		PATH = "skip",

		ui = {
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},
		max_concurrent_installers = 10,
	},
}
