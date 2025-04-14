return {
	"NeogitOrg/neogit",
	tag = "v2.0.0",
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = true,
	keys = {
		{ "<leader>=", "<cmd>Neogit<cr>", { desc = "Open Neogit" } },
	},
}
