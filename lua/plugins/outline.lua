return {
	"hedyhli/outline.nvim",
	disabled = false,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		vim.keymap.set("n", "<leader>u", "<cmd>Outline<CR>", { desc = "toggle Outline" })

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
