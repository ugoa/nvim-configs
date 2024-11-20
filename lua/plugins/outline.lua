return {
	"hedyhli/outline.nvim",
	enabled = false,
	cmd = { "Outline", "OutlineOpen" },
	opts = {
		keymaps = {
			goto_location = "o",
			peek_location = "<CR>",
		},
		symbol_folding = {
			auto_unfold = {
				hovered = true,
				only = true,
			},
		},
	},
	keys = {
		{ "<leader>u", "<cmd>Outline<cr>" },
	},
}
