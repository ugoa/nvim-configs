return {
	"alexghergh/nvim-tmux-navigation",
	lazy = false,
	config = function()
		local p = require("nvim-tmux-navigation")
		p.setup({
			disable_when_zoomed = true, -- defaults to false
		})
	end,
}
