return {
	"hrsh7th/nvim-cmp",
	lazy = false,

	dependencies = { "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer" },
	config = function()
		local cmp = require("cmp")
		local opts = require("nvchad.configs.cmp")
		cmp.setup(opts)

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
