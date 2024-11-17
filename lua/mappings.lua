local map = vim.keymap.set

-- JUST FOR SAVE!
-- Create a new keyboard shortcut in Iterm2:
--      Shortcut: cmd-s
--      Action: Send Escape Sequence
--      Esc+: [17~
map("n", "<F6>", "<cmd>wa<CR>", { desc = "save file" })
map("i", "<F6>", "<C-o>:wa<CR>", { desc = "save file" })

map("i", "<C-s>", "<C-o>:wa<CR>", { desc = "save file" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "save file" })

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

map({ "n", "v" }, "p", "P", { desc = "paste without reset register" })

-- Normal Mode
map("n", "<M-r>", "<cmd>essionSave<CR>", { desc = "save nvim session" })

map({ "n", "t" }, "<M-h>", "<cmd>NvimTmuxNavigateLeft<CR>")
map({ "n", "t" }, "<M-j>", "<cmd>NvimTmuxNavigateDown<CR>")
map({ "n", "t" }, "<M-k>", "<cmd>NvimTmuxNavigateUp<CR>")
map({ "n", "t" }, "<M-l>", "<cmd>NvimTmuxNavigateRight<CR>")

map({ "n", "t" }, "<M-g>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "toggle floating terminal" })
map({ "n", "t" }, "<M-->", function()
	require("nvchad.term").toggle({ pos = "sp", size = 0.4, id = "split_window" })
end, { desc = "toggle horizontal terminal" })
map({ "n", "t" }, "<M-=>", function()
	require("nvchad.term").toggle({ pos = "vsp", size = 0.3, id = "vertical_split_window" })
end, { desc = "toggle vertical terminal" })

map("n", "<M-s>", ":silent !open -R %:p<CR>", { desc = "Open in Finder" })

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

-- Keyboard users
vim.keymap.set("n", "<M-t>", function()
	require("menu").open("default")
end, {})

map("n", "?", "<cmd>h ", { desc = "help" })
map("n", "<c-i>", "<c-]>", { desc = "jump tag forward" })

----------------------------------------------------------------------------------------------------
-- leader key mappings
----------------------------------------------------------------------------------------------------

--- LSP mappings
local function lsp_opts(_desc)
	return { desc = "LSP: " .. _desc }
end

map("n", "<leader>a", "<cmd>enew<CR>", { desc = "buffer new" })

-- Reload all buffers to get external latest changes
map("n", "<leader>b", "<cmd>bufdo edit<CR>", { desc = "reload all buffers" })

-- <leader>c also mapped by rust lsp rustacenvim
map("n", "<leader>c", vim.lsp.buf.code_action, lsp_opts("Code action"))

map("n", "<leader>d", function()
	vim.diagnostic.open_float()
end, lsp_opts("show Line Diagnosics"))

map("n", "<leader>e", vim.lsp.buf.declaration, lsp_opts("go to declaration"))

map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

map("n", "<leader>g", vim.lsp.buf.definition, lsp_opts("go to definition"))

map("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hint" })

map("n", "<leader>i", vim.lsp.buf.implementation, lsp_opts("go to type implementation"))

map("n", "<leader>k", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "close current buffer" })

map("n", "<leader>l", vim.lsp.buf.type_definition, lsp_opts("go to type definition"))

map("n", "<leader>m", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

map("n", "<leader>o", function()
	require("nvchad.tabufline").closeBufs_at_direction("left")
	require("nvchad.tabufline").closeBufs_at_direction("right")
end, { desc = "close other buffers" })

map("n", "<leader>p", vim.lsp.buf.references, lsp_opts("show references"))

map("n", "<leader>r", require("nvchad.lsp.renamer"), lsp_opts("rename")) -- or vim.lsp.buf.rename

map("n", "<leader>s", vim.lsp.buf.signature_help, lsp_opts("show signature help"))

map("n", "<leader>t", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "close other buffers" })

-- <leader>u used to be used by Outline

-- <leader>v also mapped by rust lsp rustacenvim
map("n", "<leader>v", "<cmd>Markview splitToggle<CR>", { desc = "toggle markdown preview" })

map("n", "<leader>w", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

map("n", "<leader>x", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "close all buffers" })

map("n", "<leader>y", "<cmd>AerialToggle<CR>")

-- Others leader mappings
map("n", "<leader>jp", function()
	vim.diagnostic.goto_prev()
end, { desc = "show previous diagnosics" })
map("n", "<leader>jn", function()
	vim.diagnostic.goto_next()
end, { desc = "show next diagnosics" })
map("n", "<leader>js", vim.diagnostic.setloclist, lsp_opts("diagnostic loclist"))

-- whichkey
map("n", "<leader>jk", "<cmd>WhichKey<CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>ja", vim.lsp.buf.add_workspace_folder, lsp_opts("add workspace folder"))
map("n", "<leader>jr", vim.lsp.buf.remove_workspace_folder, lsp_opts("remove workspace folder"))

map("n", "<leader>jl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, lsp_opts("list workspace folders"))

map("n", "<leader>jt", "<cmd>TailwindFoldToggle<CR>", { desc = "toggle tailwind fold" })

map("n", "?", ":h ", { desc = "help" })
