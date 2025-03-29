local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local lib = require("nvim-tree.lib")

	local git_stage_toggle = function()
		local node = api.tree.get_node_under_cursor()
		local gs = node.git_status.file

		-- If the current node is a directory get children status
		if gs == nil then
			gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
				or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
		end

		-- If the file is untracked, unstaged or partially staged, we stage it
		if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
			vim.cmd("silent !git add " .. node.absolute_path)

		-- If the file is staged, we unstage
		elseif gs == "M " or gs == "A " then
			vim.cmd("silent !git restore --staged " .. node.absolute_path)
		end

		api.tree.reload()
	end

	local function edit_or_open()
		local node = api.tree.get_node_under_cursor()

		if node.nodes then -- is folder
			api.node.open.edit()
		else -- is file
			api.node.open.edit()
		end
	end

	local close = function()
		local node = api.tree.get_node_under_cursor()

		if node.nodes then -- node is folder
			if node.open then -- folder is open
				api.node.open.edit() -- toggles the folder from open to closed
			else -- folder is closed
				api.node.navigate.parent()
				api.node.open.edit() -- close that folder
			end
		else -- node is file
			api.node.navigate.parent() -- jump to parent folder
			api.node.open.edit() -- close that folder
		end
	end

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
	vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
	vim.keymap.set("n", "h", close, opts("Close"))
	vim.keymap.set("n", "t", api.tree.toggle_enable_filters, opts("Toggle Filters"))
	vim.keymap.set("n", "T", api.tree.change_root_to_node, opts("Set current node as root dir"))

	vim.keymap.set("n", "ga", git_stage_toggle, opts("Git Stage toggle"))
end

return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.10.0",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },

	-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree.lua#L237
	opts = {
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
				".gitlab",
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
			-- hidden_display = "all",
		},
		view = {
			adaptive_size = true,
			signcolumn = "yes", --auto, yes or no
			cursorline = true,
			width = {
				max = "25%",
				min = "18%",
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
	},
}
