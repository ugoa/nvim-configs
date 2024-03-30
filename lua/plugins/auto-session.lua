local function openTree()
	require("nvim-tree").change_dir(vim.fn.getcwd())
	require("nvim-tree.api").tree.open()
end

return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			auto_session_root_dir = "~/.local/state/nvim/sessions",
			post_restore_cmds = { openTree },
		})
	end,
}
