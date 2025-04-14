return {
	"olimorris/codecompanion.nvim",
	cmd = { "CodeCompanion", "CodeCompanionChat" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "deepseek",
					-- https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/strategies/chat/keymaps.lua
					keymaps = {
						stop = {
							modes = { n = "<C-c>", i = "<C-c>" },
						},
						close = {
							modes = { n = "q", i = "<C-q>" },
						},
					},
				},
				inline = { adapter = "deepseek" },
				agent = { adapter = "deepseek" },
			},
			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("deepseek", {
						schema = {
							model = {
								default = "deepseek-chat",
								choices = {
									["deepseek-reasoner"] = { opts = { can_reason = false } },
									"deepseek-chat",
								},
							},
						},
					})
				end,
			},
		})
	end,
}
