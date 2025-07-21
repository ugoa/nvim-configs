return {
	"echasnovski/mini.files",
	lazy = false,
	version = "*",
	opts = {
		windows = {
			-- Whether to show preview of file/directory under cursor
			preview = true,
			-- Width of focused window
			width_focus = 60,
			width_preview = 100,
		},
		mappings = {
			go_in_plus = "<CR>",
			close = "<ESC>",
		},
	},
	keys = {
		{
			"-",
			function()
				local buf_name = vim.api.nvim_buf_get_name(0)
				local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
				MiniFiles.open(path)
				MiniFiles.reveal_cwd()
			end,
			desc = "Open Mini Files",
		},
	},
}
