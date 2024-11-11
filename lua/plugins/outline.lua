return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },

	config = function()
		require("outline").setup({
			position = "right",
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
		})
	end,
}
