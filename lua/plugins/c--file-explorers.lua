return {
	{
		"echasnovski/mini.files",
		version = "*",
		opts = {
			windows = {
				preview = true,
				width_nofocus = 20,
				width_focus = 40,
				width_preview = 60,
			},
			mappings = {
				close = "<ESC>",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "h",
				go_out_plus = "h",
				synchronize = "<S-TAB>",
			},
		},
		config = function(_, opts)
			local MiniFiles = require("mini.files")
			MiniFiles.setup(opts)

			local function up_till_root()
				local p = require("mini.files").get_fs_entry().path
				local parent = vim.fs.dirname(p)
				-- https://github.com/echasnovski/mini.files/blob/main/lua/mini/files.lua#L2143-L2145
				if parent ~= vim.fn.getcwd() then
					for _ = 1, vim.v.count1 do
						MiniFiles.go_out()
						MiniFiles.trim_right()
					end
				end
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					vim.keymap.set("n", "h", up_till_root, { buffer = buf_id })
				end,
			})
		end,

		keys = {
			{
				"<Tab>",
				function()
					local MiniFiles = require("mini.files")
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
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		lazy = false, -- neo-tree will lazily load itself
		branch = "v3.x",
		opts = {
			close_if_last_window = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
			default_component_configs = {
				container = {
					enable_character_fade = false,
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},

		keys = {
			{
				"<C-n>",
				mode = { "n" },
				"<cmd>Neotree filesystem reveal left toggle<CR>",
				desc = "Toggle File explorer",
			},
		},
	},
	{
		"mikavilpas/yazi.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			{
				"<c-n>",
				"<cmd>Yazi cwd toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = true,
			yazi_floating_window_border = "single",
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			-- vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
