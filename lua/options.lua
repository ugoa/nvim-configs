local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.clipboard = "unnamedplus"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- Disable intro message and search count messages
opt.shortmess:append("sI")

-- Show sign column always (for git signs, diagnostics, etc)
o.signcolumn = "yes"
-- New splits open below current window
o.splitbelow = true
-- New splits open to the right of current window
o.splitright = true
-- Time in milliseconds to wait for a mapped sequence to complete
o.timeoutlen = 400
-- Enable persistent undo (undo history persists after closing file)
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, "/") .. ":" .. vim.env.PATH

vim.opt.colorcolumn = "120"

vim.opt.shell = "/bin/zsh"

-- FIX: https://github.com/NvChad/NvChad/issues/1907
-- Another solution is to disable sematic token in rust-tools on_init function
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L41
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Use blink block cursor in normal, visual, showmatch in insert mode
-- Use blink vert line cursor in insert mode
vim.opt.guicursor =
	"n-v-c-sm:block-blinkwait50-blinkon100-blinkoff100,i-ci:ver30-iCursor-blinkwait50-blinkon100-blinkoff100"

-- Enable cursor line highlighting and highlight both line number and text
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

vim.filetype.add({
	extension = {
		-- Treat .html files as htmldjango (Django template) files
		html = "htmldjango",
	},
})

-- https://github.com/NvChad/ui/blob/v3.0/lua/nvchad/lsp/init.lua
local x = vim.diagnostic.severity
vim.diagnostic.config({
	-- disable to avoid duplications with lsp_lines message
	virtual_text = false,
	virtual_lines = {
		only_current_line = false,
		highlight_whole_line = false,
	},
	signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
	underline = true,
	float = { border = "rounded" },
})

-- vim.opt.winborder = "rounded"
