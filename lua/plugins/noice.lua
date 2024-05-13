return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
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

  -- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },
}
