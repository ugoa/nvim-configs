local function open_or_expand()
	local lib = require("nvim-tree.lib")
	local node = lib.get_node_at_cursor()
	if node.name == ".." then
		return
	elseif node.nodes then
		lib.expand_or_collapse(node, false)
	else
		local path = node.absolute_path
		if node.link_to and not node.nodes then
			path = node.link_to
		end
		require("nvim-tree.actions").node.open_file.fn("edit", path)
	end
end

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	api.node.open.edit = open_or_expand

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- DISABLE
	vim.keymap.set("n", "<C-]>", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "-", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "<2-RightMouse>", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "g?", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "H", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "U", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "I", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "C", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "M", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "B", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "f", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "F", "<nop>", opts("Disabled"))

	-- custom mappings
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "t", api.tree.toggle_enable_filters, opts("Toggle Filters"))
end

return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		on_attach = my_on_attach,
		filters = {
			custom = { ".git" },
			exclude = { ".gitignore" },
		},
		actions = {
			change_dir = {
				enable = false,
			},
		},
		update_focused_file = {
			enable = true,
		},
		renderer = {
			root_folder_label = ":~:s?$?",
			highlight_opened_files = "all",
			highlight_git = "none",
			icons = {
				git_placement = "after",
				modified_placement = "signcolumn",
				show = {
					folder_arrow = false,
				},
			},
		},
		view = {
			adaptive_size = true,
			signcolumn = "yes", --auto, yes or no
			width = {
				max = "40%",
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
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},
		modified = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},
	},
}
