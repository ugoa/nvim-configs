require("nvchad.options")

-- add yours here!
vim.opt.colorcolumn = "120"

-- stylua: ignore start
-- stylua: ignore end

-- FIX: https://github.com/NvChad/NvChad/issues/1907
-- Another solution is to disable sematic token in rust-tools on_init function
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L41
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function(data)
-- 		if vim.fn.argv(0) == "" then
-- 			require("nvim-tree.api").tree.open()
-- 		elseif vim.fn.isdirectory(data.file) == 1 then
-- 			-- change to the directory and open the tree
-- 			vim.cmd.cd(data.file)
-- 			require("nvim-tree.api").tree.open()
-- 		end
-- 	end,
-- })
