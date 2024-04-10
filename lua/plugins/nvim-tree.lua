local function open_or_expand()
	local lib = require("nvim-tree.lib")
	local mode = "edit"
	local toggle_group = false
	local node = lib.get_node_at_cursor()
	if node.name == ".." then
		return
	elseif node.nodes then
		lib.expand_or_collapse(node, toggle_group)
	elseif not toggle_group then
		local path = node.absolute_path
		if node.link_to and not node.nodes then
			path = node.link_to
		end
		require("nvim-tree.actions").node.open_file.fn(mode, path)
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

	-- custom mappings
	vim.keymap.set("n", "<C-]>", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "-", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "<2-RightMouse>", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "g?", "<nop>", opts("Disabled"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "f", api.live_filter.clear, opts("Live Filter: Clear"))
	vim.keymap.set("n", "F", api.live_filter.start, opts("Live Filter: Start"))
end

return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		on_attach = my_on_attach,
		git = { enable = true },
		filters = {
			dotfiles = true,
		},
		actions = {
			change_dir = {
				enable = false,
			},
		},
		renderer = {
			root_folder_label = ":~:s?$?",
			highlight_opened_files = "all",
			icons = {
				git_placement = "signcolumn",
				modified_placement = "signcolumn",
			},
		},
		view = {
			adaptive_size = true,
			signcolumn = "auto",
			width = {
				max = "40%",
				min = "20%",
			},
		},
		system_open = {
			cmd = "open",
			args = { "-R" },
		},
	},
}
