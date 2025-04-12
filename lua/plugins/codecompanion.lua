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
				chat = { adapter = "deepseek" },
				inline = { adapter = "deepseek" },
				agent = { adapter = "deepseek" },
			},
			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("deepseek", {
						schema = {
							model = {
								default = "deepseek-reasoner",
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
