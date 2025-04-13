local map = vim.keymap.set
--- LSP mappings
local function lsp_opts(_desc)
	return { desc = "LSP: " .. _desc }
end

map("i", "<C-s>", "<C-o><cmd>wa<CR>", { desc = "save file" })
map("n", "<C-s>", "<cmd>wa<CR>", { desc = "save file" })

map("i", "<C-h>", vim.lsp.buf.signature_help, lsp_opts("go to signature_help"))

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "i", "c" }, "<C-f>", "<Right>", { desc = "move right" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "move left" })
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "move beginning" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "move to end" })

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- https://stackoverflow.com/a/5093286/1077486
map("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true, desc = "paste without reset register" })

map({ "n", "t" }, "<M-h>", "<c-w>h", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<M-j>", "<c-w>j", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<M-k>", "<c-w>k", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<M-l>", "<c-w>l", { desc = "terminal escape terminal mode" })

map({ "n", "t" }, "<M-g>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "toggle floating terminal" })
map({ "n", "t" }, "<M-->", function()
	require("nvchad.term").toggle({ pos = "sp", size = 0.4, id = "split_window" })
end, { desc = "toggle horizontal terminal" })
map({ "n", "t" }, "<M-=>", function()
	require("nvchad.term").toggle({ pos = "vsp", size = 0.3, id = "vertical_split_window" })
end, { desc = "toggle vertical terminal" })

map("n", "<M-s>", "<cmd>!open -R %:p<CR>", { desc = "Open in Finder" })

-- Visual mode
map("v", "A", "<cmd>normal A", { desc = "append to visual block" })

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

map("n", "grd", vim.lsp.buf.definition, lsp_opts("go to definition"))
map("n", "gre", vim.lsp.buf.declaration, lsp_opts("go to declaration"))
map("n", "grt", vim.lsp.buf.type_definition, lsp_opts("go to type definition"))
map("n", "grs", vim.lsp.buf.signature_help, lsp_opts("go to signature_help"))
map("n", "grh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hint" })
map("n", "grw", vim.lsp.buf.add_workspace_folder, lsp_opts("add workspace folder"))

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "telescope find word" })
map("n", "<leader>fc", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "telescope lsp workspace symbols" })
map("n", "<leader>fb", function()
	require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
end, { desc = "telescope list current open buffers" })

map("n", "<leader>i", "<cmd>Inspect!<cr>", { desc = "Inspect under cursor" })

map("n", "<leader>kk", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "close current buffer" })
map("n", "<leader>kl", function()
	require("nvchad.tabufline").closeBufs_at_direction("left")
end, { desc = "close buffer at left" })
map("n", "<leader>kr", function()
	require("nvchad.tabufline").closeBufs_at_direction("right")
end, { desc = "close current at right" })
map("n", "<leader>ko", function()
	require("nvchad.tabufline").closeBufs_at_direction("left")
	require("nvchad.tabufline").closeBufs_at_direction("right")
end, { desc = "close other buffers" })
map("n", "<leader>ka", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "close all buffers" })
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

map("n", "<leader>p", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save session" })
map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "restores a session" })
map("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "deletes a session based on the `cwd` from `root_dir`" })
map("n", "<leader>st", "<cmd>SessionToggleAutoSave<cr>", { desc = "toggles autosave session" })
map("n", "<leader>sp", "<cmd>SessionPurgeOrphaned<cr>", { desc = "removes all orphaned sessions" })
map("n", "<leader>sf", "<cmd>SessionSearch<cr>", { desc = "open a session picker" })

map("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "toggle AI Assistant" })
map("n", "<leader>aa", "<cmd>CodeCompanion<cr>", { desc = "AI Prompt at current location" })

map("n", "<leader>v", "<cmd>RenderMarkdown buf_toggle<CR>", { desc = "toggle markdown preview" })

map("n", "<leader>w", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

map("n", "<leader>x", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "close all buffers" })

map("n", "<leader>y", "<cmd>AerialToggle<CR>", { desc = "toggle code outline" })

map("n", "<leader>z", vim.diagnostic.open_float, { desc = "show Diagnosics" })

map("n", "<leader>n", "<cmd>set relativenumber!<CR>", { desc = "show Diagnosics" })

-- <leader>e
-- <leader>g
-- <leader>h
-- <leader>q
-- <leader>o
-- <leader>r
-- <leader>u
-- <leader>l
-- <leader>w
-- <leader>c
-- <leader>b

map("n", "<leader>rr", "<cmd>RustLsp run<cr>", { desc = "Run closet Cargo targets" })
map("n", "<leader>rl", "<cmd>RustLsp runnables<cr>", { desc = "List runnable targets" })
map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", { desc = "List tests" })

-- When lines are on, text is off. Text on, lines off. Minimize clutter.
vim.keymap.set("", "<leader>d", function()
	vim.diagnostic.config({
		virtual_lines = not vim.diagnostic.config().virtual_lines,
		-- virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, { desc = "Toggle diagnostic [l]ines" })

-- <leader>J* Group
map("n", "<leader>jb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
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

map("n", "<leader>jh", function()
	require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- Reload all buffers to get external latest changes
map("n", "<leader>ji", "<cmd>bufdo edit<CR>", { desc = "reload all buffers" })

map("n", "<leader>js", vim.diagnostic.setloclist, lsp_opts("diagnostic loclist"))

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
