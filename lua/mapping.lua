local map = vim.keymap.set

map("i", "<C-s>", "<C-o><cmd>wa<CR>", { desc = "save file" })

map("n", "<C-s>", "<cmd>wa<CR>", { desc = "save file" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "i", "c" }, "<C-f>", "<Right>", { desc = "move right" })

map({ "i", "c" }, "<C-b>", "<Left>", { desc = "move left" })

map({ "i", "c" }, "<C-a>", "<Home>", { desc = "move beginning" })

map({ "i", "c" }, "<C-e>", "<End>", { desc = "move to end" })

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<Tab>", "<cmd>bnext<CR>", { nowait = true, desc = "buffer goto next" })
map("n", "<BS>", "<cmd>bprevious<CR>", { nowait = true, desc = "buffer goto prev" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- https://stackoverflow.com/a/5093286/1077486
map(
  "x",
  "p",
  function() return 'pgv"' .. vim.v.register .. "y" end,
  { remap = false, expr = true, desc = "paste without reset register" }
)

-- Visual mode
map("v", "A", ":normal A", { desc = "append to visual block" })

map("n", "S", vim.lsp.buf.signature_help, { desc = "go to signature_help" })

-- always center search/nav results
vim.keymap.set("n", "n", "nzz", { desc = "find next and center screen", silent = true })

vim.keymap.set("n", "N", "Nzz", { desc = "find previous and center screen", silent = true })

vim.keymap.set("n", "*", "*zz", { desc = "highlight next and center screen", silent = true })

vim.keymap.set("n", "#", "#zz", { desc = "highlight previous and center screen", silent = true })

vim.keymap.set("n", "g*", "g*zz", { desc = "highlight all and center screen", silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "go half page up and center screen", silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "go half page down and center screen", silent = true })

map("n", "?", ":h ", { desc = "help" })

map({ "n", "v" }, "H", "0", { desc = "go to line non-blank start" })

map({ "n", "v" }, "L", "g_", { desc = "go to line end" })

----------------------------------------------------------------------------------------------------
-- Meta (Alt/Option) key mappings:
--    <M-ABCDEFGHIJKLMNOPQRSTUVWXYZ-=;>
--    <M-abcdefghijklmnop rstuvwxyz-=;>
----------------------------------------------------------------------------------------------------

map(
  "n",
  "<M-b>",
  "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<CR>",
  { desc = "telescope find buffers" }
)

map("n", "<M-c>", vim.lsp.buf.code_action, { desc = "code action" })

map("n", "<M-d>", vim.lsp.buf.definition, { desc = "LSP definitions" })

map("n", "<M-e>", vim.lsp.buf.rename, { desc = "LSP rename" })

map(
  "n",
  "<M-i>",
  function() require("telescope.builtin").lsp_implementations() end,
  { desc = "telescope LSP implementations" }
)

map({ "n", "t" }, "<M-h>", "<c-w>h", { desc = "move to left panel" })

map({ "n", "t" }, "<M-j>", "<c-w>j", { desc = "move to below panel" })

map({ "n", "t" }, "<M-k>", "<c-w>k", { desc = "move to upper panel" })

map({ "n", "t" }, "<M-l>", "<c-w>l", { desc = "move to right panel" })

map("n", "<M-m>", "<cmd>Telescope bookmarks list<CR>", { desc = "toggle  bookmarks" })

map("n", "<M-n>", "<cmd>Telescope git_commits<CR>", { desc = "toggle git commits" })

map("n", "<M-o>", "<cmd>AerialToggle<CR>", { desc = "toggle code outline" })

map("n", "<M-r>", function() require("telescope.builtin").lsp_references() end, { desc = "telescope LSP reference" })

map("n", "<M-s>", "<cmd>!open -R %:p<CR>", { desc = "Open in Finder" })

map("n", "<M-p>", "<cmd>enew<CR>", { desc = "buffer new" })

map(
  { "n", "t" },
  "<M-t>",
  function() require("terminal").toggle({ pos = "float", id = "floatTerm" }) end,
  { desc = "toggle floating terminal" }
)

map("n", "<M-u>", "<cmd>Telescope git_status<CR>", { desc = "toggle git status" })

map("n", "<M-v>", "<cmd>Noice telescope<CR>", { desc = "noice history" })
-- Telescope
map("n", "<M-w>", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "telescope find workspace symbol" })

map("n", "<M-x>", vim.diagnostic.open_float, { desc = "show Diagnosics" })

map(
  "n",
  "<M-y>",
  function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
  { desc = "Toggle inlay hint" }
)

-- When lines are on, text is off. Text on, lines off. Minimize clutter.
map("", "<M-z>", function()
  vim.diagnostic.config({
    virtual_lines = not vim.diagnostic.config().virtual_lines,
    -- virtual_text = not vim.diagnostic.config().virtual_text,
  })
end, { desc = "Toggle diagnostic lines" })

map("n", "<M-;>", function() require("grug-far").open({ transient = true }) end, { desc = "Open search and replace" })

map(
  { "n", "t" },
  "<M-->",
  function() require("terminal").toggle({ pos = "sp", size = 0.4, id = "split_window" }) end,
  { desc = "toggle horizontal terminal" }
)

map(
  { "n", "t" },
  "<M-=>",
  function() require("terminal").toggle({ pos = "vsp", size = 0.3, id = "vertical_split_window" }) end,
  { desc = "toggle vertical terminal" }
)

----------------------------------------------------------------------------------------------------
-- Leader key mappings:
--    <leader>-ABCDEFGHIJKLMNOPQRSTUVWXYZ-=;
--    <leader>-a c   ghijklm o  rs     yz  ;
----------------------------------------------------------------------------------------------------
map("n", "<leader>i", "<cmd>Inspect<cr>", { desc = "Inspect under cursor" })

map("n", "<leader>k", "<cmd>bdelete<cr>", { desc = "close current buffer" })
map("n", "<leader>l", "<cmd>execute '1,' . (bufnr('%') - 1) . 'bdelete'<cr>", { desc = "close current at left" })
map(
  "n",
  "<leader>r",
  "<cmd>execute (bufnr('%') + 1) . ',' . bufnr('$') . 'bdelete!'<cr>",
  { desc = "close current at right" }
)
--https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one#comment84748132_42071865
map("n", "<leader>o", "<cmd>%bd|e#|bd#<cr>", { desc = "close other buffers" })
map("n", "<leader>a", "<cmd>%bd<cr>", { desc = "close all buffers" })

map("n", "<leader>z", "<cmd>ColorizerToggle<CR>", { desc = "Toggle Colorizer to highlight RGB color" })

map("n", "<leader>v", "<cmd>RenderMarkdown buf_toggle<CR>", { desc = "toggle markdown preview" })

map(
  "n",
  "<leader>mm",
  function() require("conform").format({ lsp_fallback = true }) end,
  { desc = "general format file" }
)

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

map("n", "<leader>yf", "<cmd>let @+ = expand('%:t')<CR>", { desc = "Copy file name to clipboard" })
map("n", "<leader>yy", "<cmd>let @+ = expand('%')<CR>", { desc = "Copy relative path to clipboard" })
map("n", "<leader>ya", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Copy absolute path to clipboard" })

map("n", "<leader>tn", "<cmd>setl relativenumber! relativenumber?<CR>", { desc = "toggle relativenumber" })
map("n", "<leader>tw", "<cmd>setl wrap! wrap?<CR>", { desc = "toggle word wrap" })

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

map("n", "<leader>xr", "<cmd>RustLsp run<cr>", { desc = "Run closet Cargo targets" })
map("n", "<leader>xl", "<cmd>RustLsp runnables<cr>", { desc = "List runnable targets" })
map("n", "<leader>xt", "<cmd>RustLsp testables<cr>", { desc = "List tests" })

map("n", "<leader>ji", "<cmd>TSEnable highlight<CR>", { desc = "treesitter enable highlight" })

-- whichkey
map("n", "<leader>jk", "<cmd>WhichKey<CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>jm", function() require("smear_cursor").toggle() end, { desc = "toggle cursor animation" })
