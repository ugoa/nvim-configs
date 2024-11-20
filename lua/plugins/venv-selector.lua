return {
	"linux-cultist/venv-selector.nvim",
	cmd = { "VenvSelect" },
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	branch = "regexp",
	keys = {
		{ "<leader>jv", "<cmd>VenvSelect<cr>" },
	},
}
