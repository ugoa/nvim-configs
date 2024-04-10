return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			vue = { "eslint" },
		}

		local eslint = lint.linters.eslint
		eslint.args = {
			".",
			"--fix",
		}
	end,
}
