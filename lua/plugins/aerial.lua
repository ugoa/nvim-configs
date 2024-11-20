return {
	"stevearc/aerial.nvim",
	cmd = { "AerialToggle" }, -- for code outline
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		keymaps = {
			["<CR>"] = "actions.scroll",
			["p"] = "actions.jump",
		},
	},
}
