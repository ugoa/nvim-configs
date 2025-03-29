return {
	"folke/noice.nvim",
	event = "VeryLazy",
	version = "v4.10.0", -- Recommended
	dependencies = {
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000",
					timeout = 5000,
				})
			end,
		},

		{
			"MunifTanjim/nui.nvim",
			dependencies = {
				"stevearc/dressing.nvim", -- load dressing.nvim first before nui.nvim hiject the vim.ui.input/select event
			},
		},
	},
	opts = {
		views = {
			cmdline_popup = {
				position = {
					row = "15%",
					col = "50%",
				},
				size = {
					width = "auto",
					height = "auto",
				},
			},
			mini = {
				win_options = {
					winblend = 0, -- Get bg transparent in mini view
				},
			},
		},
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			view_error = "mini", -- view for errors
			view_warn = "mini", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
		lsp = {
			message = {
				view = "mini",
				opts = {},
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
			signature = {
				enabled = false,
			},
		},
		cmdline = {
			format = {
				search_down = {
					view = "cmdline_popup",
					icon = " ",
				},
				search_up = {
					view = "cmdline_popup",
					icon = " ",
				},
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
			{
				view = "cmdline",
				filter = { event = "msg_showmode" },
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
		},
	},
}
