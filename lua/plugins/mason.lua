return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },

	opts = function()
		return {
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
				-- for Solid.js, React and Typescript/Javascript
				"typescript-language-server",
				"prettier",
				"djlint", -- for htmldjango/jinja formatting
				"tailwindcss-language-server",
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
		}
	end,
}
