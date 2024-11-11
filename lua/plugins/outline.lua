return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		local opts = {
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
		}
		require("outline").setup(opts)
	end,
}
