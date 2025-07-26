local lsp = function()
	if rawget(vim, "lsp") then
		for _, client in ipairs(vim.lsp.get_clients()) do
			local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
			if client.attached_buffers[stbufnr] then
				return (vim.o.columns > 100 and "  LSP: " .. client.name .. " ") or "   LSP "
			end
		end
	end

	return ""
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	after = "catppuccin",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = {
		options = {
			theme = "catppuccin",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1, -- Displays path relative to cmd
				},
			},
			lualine_x = {
				"encoding",
				"filetype",
				lsp,
			},
		},
	},
}
