local opt = vim.opt

local g = vim.g

g.loaded_netrw = 1

g.loaded_netrwPlugin = 1

opt.laststatus = 0

-- opt.shell = "/opt/homebrew/bin/nu"

opt.showmode = false

opt.termguicolors = true

opt.clipboard = "unnamedplus"

-- Indenting
opt.expandtab = true

opt.shiftwidth = 2

opt.smartindent = true

opt.tabstop = 2

opt.softtabstop = 2

opt.fillchars = { eob = " " }

opt.ignorecase = true

opt.smartcase = true

opt.mouse = "a"

-- Numbers
opt.number = true

opt.numberwidth = 2

opt.ruler = false

opt.relativenumber = true

opt.termguicolors = true

opt.swapfile = false

-- Disable intro message and search count messages
opt.shortmess:append("sI")

-- Show sign column always (for git signs, diagnostics, etc)
opt.signcolumn = "yes"

-- New splits open below current window
opt.splitbelow = true

-- New splits open to the right of current window
opt.splitright = true

-- Time in milliseconds to wait for a mapped sequence to complete
opt.timeoutlen = 400

-- Enable persistent undo (undo history persists after closing file)
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

opt.scrolloff = 5

opt.colorcolumn = "120"

-- disable some default providers
g.loaded_node_provider = 0

g.loaded_python3_provider = 0

g.loaded_perl_provider = 0

g.loaded_ruby_provider = 0

-- Enable cursor line highlighting and highlight both line number and text
opt.cursorline = true

opt.cursorlineopt = "both"

-- Use blink block cursor in normal, visual, showmatch in insert mode
-- Use blink vert line cursor in insert mode
opt.guicursor =
	"n-v-c-sm:block-blinkwait50-blinkon100-blinkoff100,i-ci:ver30-iCursor-blinkwait50-blinkon100-blinkoff100"

-- add binaries installed by mason.nvim to path
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, "/") .. ":" .. vim.env.PATH

vim.filetype.add({
	extension = {
		-- Treat .html files as htmldjango (Django template) files
		html = "htmldjango",
	},
})

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

-- Set global borde
local original_signature_help = vim.lsp.buf.signature_help
vim.lsp.buf.signature_help = function(opts)
	opts = opts or {}
	opts.border = "rounded"
	original_signature_help(opts)
end
