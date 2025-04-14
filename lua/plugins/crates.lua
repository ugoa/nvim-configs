return {
	"Saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	opts = {
		popup = {
			autofocus = true,
			border = "rounded",
		},
		completion = {
			crates = {
				enabled = true,
				max_results = 8, -- The maximum number of search results to display
				min_chars = 3, -- The minimum number of charaters to type before completions begin appeari
			},
			cmp = {
				enabled = true,
			},
		},
		lsp = {
			enabled = true,
			actions = true,
			completion = true,
			hover = true,
		},
	},
}
