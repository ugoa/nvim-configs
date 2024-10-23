require("nvchad.options")

-- add yours here!
vim.opt.colorcolumn = "120"
-- vim.opt.conceallevel = 2

-- vim.opt.shell = "/opt/homebrew/bin/nu"
vim.opt.shell = "/bin/zsh"

vim.o.tabstop = 2 -- A TAB character looks like n spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

vim.opt.relativenumber = true

-- FIX: https://github.com/NvChad/NvChad/issues/1907
-- Another solution is to disable sematic token in rust-tools on_init function
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L41
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Use blink block cursor in normal, visual, showmatch in insert mode
-- Use blink vert line cursor in insert mode
vim.opt.guicursor =
	"n-v-c-sm:block-blinkwait50-blinkon100-blinkoff100,i-ci:ver30-iCursor-blinkwait50-blinkon100-blinkoff100"

vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
