-- https://github.com/echasnovski/mini.files
return {
	"echasnovski/mini.files",
	version = "*",
	opts = {
		windows = {
			preview = false,
			width_nofocus = 20,
			width_focus = 40,
			width_preview = 60,
		},
		mappings = {
			close = "<ESC>",
			go_in = "l",
			go_in_plus = "<CR>",
			go_out = "H",
			go_out_plus = "h",
		},
	},
	keys = {
		{
			"-",
			function()
				if not MiniFiles.close() then
					local buf_name = vim.api.nvim_buf_get_name(0)
					local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
					MiniFiles.open(path)
					MiniFiles.reveal_cwd()
				end
			end,
			desc = "Open Mini Files",
		},
	},
}
