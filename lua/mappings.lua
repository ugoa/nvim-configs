local map = vim.keymap.set
--- LSP mappings
local function lsp_opts(_desc)
	return { desc = "LSP: " .. _desc }
end

map("i", "<C-s>", "<C-o><cmd>wa<CR>", { desc = "save file" })
map("n", "<C-s>", "<cmd>wa<CR>", { desc = "save file" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "i", "c" }, "<C-f>", "<Right>", { desc = "move right" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "move left" })
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "move beginning" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "move to end" })

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<tab>", "<cmd>bnext<CR>", { desc = "buffer goto next" })

map("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "buffer goto prev" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- https://stackoverflow.com/a/5093286/1077486
map("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true, desc = "paste without reset register" })

-- <M-ABCDEFGHIJKLMNOPQRSTUVWXYZ-=;>
-- <M-xx x xxxx  x x x xxx     xxx >

map("n", "<M-n>", "<cmd>AerialToggle<CR>", { desc = "toggle code outline" })
map("n", "<M-a>", "<cmd>enew<CR>", { desc = "buffer new" })
map({ "n", "t" }, "<M-t>", function()
	require("custom.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "toggle floating terminal" })
map({ "n", "t" }, "<M-->", function()
	require("custom.term").toggle({ pos = "sp", size = 0.4, id = "split_window" })
end, { desc = "toggle horizontal terminal" })
map({ "n", "t" }, "<M-=>", function()
	require("custom.term").toggle({ pos = "vsp", size = 0.3, id = "vertical_split_window" })
end, { desc = "toggle vertical terminal" })
map("n", "<M-z>", vim.diagnostic.open_float, { desc = "show Diagnosics" })

-- When lines are on, text is off. Text on, lines off. Minimize clutter.
map("", "<M-l>", function()
	vim.diagnostic.config({
		virtual_lines = not vim.diagnostic.config().virtual_lines,
		-- virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, { desc = "Toggle diagnostic [l]ines" })

-- Telescope
map("n", "<M-f>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<M-g>", "<cmd>Telescope live_grep<cr>", { desc = "telescope find word" })
map(
	"n",
	"<M-b>",
	"<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<CR>",
	{ desc = "telescope find buffers" }
)
map("n", "<M-r>", function()
	require("telescope.builtin").lsp_references()
end, { desc = "telescope LSP reference" })
map("n", "<M-i>", function()
	require("telescope.builtin").lsp_implementations()
end, { desc = "telescope LSP implementations" })
map("n", "<M-d>", function()
	require("telescope.builtin").lsp_definitions()
end, { desc = "telescope LSP definitions" })

map("n", "<M-s>", "<cmd>!open -R %:p<CR>", { desc = "Open in Finder" })

map("n", "<M-h>", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, lsp_opts("Toggle inlay hint"))

-- Visual mode
map("v", "A", ":normal A", { desc = "append to visual block" })

map("n", "S", vim.lsp.buf.signature_help, lsp_opts("go to signature_help"))

-- always center search/nav results
vim.keymap.set("n", "n", "nzz", { desc = "find next and center screen", silent = true })
vim.keymap.set("n", "N", "Nzz", { desc = "find previous and center screen", silent = true })
vim.keymap.set("n", "*", "*zz", { desc = "highlight next and center screen", silent = true })
vim.keymap.set("n", "#", "#zz", { desc = "highlight previous and center screen", silent = true })
vim.keymap.set("n", "g*", "g*zz", { desc = "highlight all and center screen", silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "go half page up and center screen", silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "go half page down and center screen", silent = true })

map("n", "?", "<cmd>h ", { desc = "help" })
map("n", "<c-i>", "<c-]>", { desc = "jump tag forward" })

----------------------------------------------------------------------------------------------------
-- leader key mappings
----------------------------------------------------------------------------------------------------
map("n", "<leader>i", "<cmd>Inspect!<cr>", { desc = "Inspect under cursor" })

map("n", "<leader>kk", "<cmd>bdelete<cr>", { desc = "close current buffer" })
map("n", "<leader>kl", "<cmd>execute '1,' . (bufnr('%') - 1) . 'bdelete'<cr>", { desc = "close current at left" })
map(
	"n",
	"<leader>kr",
	"<cmd>execute (bufnr('%') + 1) . ',' . bufnr('$') . 'bdelete!'<cr>",
	{ desc = "close current at right" }
)
--https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one#comment84748132_42071865
map("n", "<leader>ko", "<cmd>%bd|e#|bd#<cr>", { desc = "close other buffers" })
map("n", "<leader>ka", "<cmd>%bd<cr>", { desc = "close all buffers" })
map("n", "<leader>kq", "<cmd>silent q!<cr>", { desc = "close window" })
map("n", "<leader>mm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

map("n", "<leader>md", function()
	require("conform").format({
		timeout_ms = 20000, -- 20 seconds, because djlint is SLOWWWWWWWWW
		lsp_fallback = true,
	})
end, { desc = "djlint format" })

map({ "n" }, "<leader>gt", "<cmd>Neogit<CR>", { desc = "Open Neogit" })

map({ "n", "v" }, "<leader>gy", "<cmd>GitLink<CR>", { desc = "Yank git link" })
map({ "n", "v" }, "<leader>gY", "<cmd>GitLink!<CR>", { desc = "Open git link" })

map("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save session" })
map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "restores a session" })
map("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "deletes a session based on the `cwd` from `root_dir`" })
map("n", "<leader>st", "<cmd>SessionToggleAutoSave<cr>", { desc = "toggles autosave session" })
map("n", "<leader>sp", "<cmd>SessionPurgeOrphaned<cr>", { desc = "removes all orphaned sessions" })
map("n", "<leader>sf", "<cmd>SessionSearch<cr>", { desc = "open a session picker" })

map("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "toggle AI Assistant" })
map("n", "<leader>aa", "<cmd>CodeCompanion<cr>", { desc = "AI Prompt at current location" })

map("n", "<leader>v", "<cmd>RenderMarkdown buf_toggle<CR>", { desc = "toggle markdown preview" })

map("n", "<leader>yf", "<cmd>let @+ = expand('%:t')<CR>", { desc = "Copy file name to clipboard" })
map("n", "<leader>yy", "<cmd>let @+ = expand('%')<CR>", { desc = "Copy relative path to clipboard" })
map("n", "<leader>ya", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Copy absolute path to clipboard" })

map("n", "<leader>tn", "<cmd>setl relativenumber! relativenumber?<CR>", { desc = "toggle relativenumber" })
map("n", "<leader>tw", "<cmd>setl wrap! wrap?<CR>", { desc = "toggle word wrap" })

-- <leader>e
-- <leader>g
-- <leader>h
-- <leader>q
-- <leader>r
-- <leader>u
-- <leader>l
-- <leader>w
-- <leader>b

local crates = require("crates")
map("n", "<leader>cc", crates.toggle, { silent = true, desc = "toggle" })
map("n", "<leader>cr", crates.reload, { silent = true, desc = "reload" })
map("n", "<leader>cs", crates.show_popup, { silent = true, desc = "show general popup" })
map("n", "<leader>cv", crates.show_versions_popup, { silent = true, desc = "show versions" })
map("n", "<leader>cf", crates.show_features_popup, { silent = true, desc = "show features" })
map("n", "<leader>cd", crates.show_dependencies_popup, { silent = true, desc = "show deps" })
map("n", "<leader>cu", crates.update_crate, { silent = true, desc = "update crate" })
map("v", "<leader>cu", crates.update_crates, { silent = true, desc = "update crates" })
map("n", "<leader>ca", crates.update_all_crates, { silent = true, desc = "update all crates" })
map("n", "<leader>cU", crates.upgrade_crate, { silent = true, desc = "upgrade crate" })
map("v", "<leader>cU", crates.upgrade_crates, { silent = true, desc = "upgrade crates" })
map("n", "<leader>cA", crates.upgrade_all_crates, { silent = true, desc = "upgrade all crates" })
map("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, { silent = true, desc = "expand" })
map("n", "<leader>cX", crates.extract_crate_into_table, { silent = true, desc = "extract" })
map("n", "<leader>cH", crates.open_homepage, { silent = true, desc = "open homepage" })
map("n", "<leader>cR", crates.open_repository, { silent = true, desc = "open repo" })
map("n", "<leader>cD", crates.open_documentation, { silent = true, desc = "open doc" })
map("n", "<leader>cC", crates.open_crates_io, { silent = true, desc = "open crates.io" })
map("n", "<leader>cL", crates.open_lib_rs, { silent = true, desc = "open lib.rs" })

map("n", "<leader>rr", "<cmd>RustLsp run<cr>", { desc = "Run closet Cargo targets" })
map("n", "<leader>rl", "<cmd>RustLsp runnables<cr>", { desc = "List runnable targets" })
map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", { desc = "List tests" })

-- <leader>J* Group

map("n", "<leader>ja", "<cmd>ColorizerToggle<CR>", { desc = "noice last message" })
map("n", "<leader>jc", function()
	require("noice").cmd("last")
end, { desc = "noice last message" })
map("n", "<leader>jd", function()
	require("noice").cmd("history")
end, { desc = "noice history" })
map("n", "<leader>je", function()
	require("noice").cmd("all")
end, { desc = "noice all" })
map("n", "<leader>jf", function()
	require("noice").cmd("dismiss")
end, { desc = "noice dismiss all" })

-- whichkey
map("n", "<leader>jg", "<cmd>TSEnable highlight<CR>", { desc = "treesitter enable highlight" })

-- Reload all buffers to get external latest changes
map("n", "<leader>ji", "<cmd>bufdo edit<CR>", { desc = "reload all buffers" })

-- whichkey
map("n", "<leader>jk", "<cmd>WhichKey<CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>jr", vim.lsp.buf.remove_workspace_folder, lsp_opts("remove workspace folder"))

map("n", "<leader>jl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, lsp_opts("list workspace folders"))

map("n", "<leader>jt", "<cmd>TailwindFoldToggle<CR>", { desc = "toggle tailwind fold" })

map("n", "<leader>jm", function()
	require("smear_cursor").toggle()
end, { desc = "toggle cursor animation" })

map("n", "?", ":h ", { desc = "help" })
map({ "n", "v" }, "H", "0", { desc = "go to line non-blank start" })
map({ "n", "v" }, "L", "g_", { desc = "go to line end" })
