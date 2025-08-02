return {
	"HiPhish/jinja.vim",
	lazy = false,
	config = function()
		local autocmd = vim.api.nvim_create_autocmd

		autocmd({ "FileType" }, {
			pattern = { "html", "sql", "yaml", "yml", "python" },
			callback = function()
				vim.cmd([[ call jinja#AdjustFiletype() ]])
			end,
		})
	end,
}
