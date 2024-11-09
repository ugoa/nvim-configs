local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end
	-- custom mappings
	vim.keymap.set("n", "t", api.tree.toggle_enable_filters, opts("Toggle Filters"))
	vim.keymap.set("n", "T", api.tree.change_root_to_node, opts("Set current node as root dir"))

	-- popup menu mouse users + nvimtree users!
	vim.keymap.set("n", "<RightMouse>", function()
		vim.cmd.exec('"normal! \\<RightMouse>"')

		local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
		require("menu").open(options, { mouse = true })
	end, {})
end

return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.8.0",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },

	-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree.lua#L237
	opts = function()
		dofile(vim.g.base46_cache .. "nvimtree")

		return {
			on_attach = on_attach,
			reload_on_bufenter = true,
			auto_reload_on_write = true,
			disable_netrw = true,
			hijack_cursor = true,
			filters = {
				enable = true,
				git_ignored = true,
				dotfiles = true,
				git_clean = false,
				no_buffer = false,
				no_bookmark = false,
				exclude = {
					".gitignore",
					".env.template",
					".env.sample",
					".dockerignore",
					".gitlab-ci.yml",
					".gitlab-ci.yaml",
					".values",
					".terraform",
				},
			},
			actions = {
				change_dir = {
					enable = false,
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			renderer = {
				root_folder_label = ":~:s?$?",
				highlight_opened_files = "all",
				icons = {
					git_placement = "after",
					modified_placement = "signcolumn",
				},
				indent_markers = {
					enable = false,
				},
				group_empty = true,
				full_name = true,
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "justfile" },
				hidden_display = "all",
			},
			view = {
				adaptive_size = true,
				centralize_selection = true,
				signcolumn = "yes", --auto, yes or no
				cursorline = true,
				width = {
					max = "30%",
					min = "20%",
				},
			},
			system_open = {
				cmd = "open",
				args = { "-R" },
			},
			help = {
				sort_by = "desc",
			},
			git = {
				show_on_open_dirs = false,
			},
			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,
			},
		}
	end,
}
