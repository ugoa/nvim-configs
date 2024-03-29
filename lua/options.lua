require("nvchad.options")

-- add yours here!

-- FIX: https://github.com/NvChad/NvChad/issues/1907
-- Another solution is to disable sematic token in rust-tools on_init function
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L41
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level
