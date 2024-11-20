local function openTree()
	require("nvim-tree").change_dir(vim.fn.getcwd())
	local api = require("nvim-tree.api")
	api.tree.open()
	api.node.open.edit()
end

return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		log_level = "error",
		post_restore_cmds = { openTree },
		cwd_change_handling = nil,
	},
}
