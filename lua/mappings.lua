local map = vim.keymap.set

-- JUST FOR SAVE!
-- Create a new keyboard shortcut in Iterm2:
--      Shortcut: cmd-s
--      Action: Send Escape Sequence
--      Esc+: [17~
map("i", "<F6>", "<C-o>:wa<CR>", { desc = "save file" })
map("i", "<C-s>", "<C-o>:wa<CR>", { desc = "save file" })
map("n", "<F6>", "<Cmd>:wa<CR>", { desc = "save file" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "i", "c" }, "<C-f>", "<Right>", { desc = "move right" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "move left" })
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "move beginning" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "move to end" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

map("n", "<leader>a", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

map("n", "<leader>th", function()
	require("nvchad.themes").open()
end, { desc = "show nvchad themes" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<leader>v", function()
	require("nvchad.term").new({ pos = "vsp" })
end, { desc = "terminal new vertical term" })

-- toggleable

-- whichkey
map("n", "<leader>wk", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map({ "n", "v" }, "p", "P", { desc = "paste without reset register" })

-- Normal Mode
map("n", "<M-r>", "<Cmd>SessionSave<CR>", { desc = "save nvim session" })

map("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
map("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
map("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
map("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>")

map({ "n", "t" }, "<M-g>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "toggle floating terminal" })
map({ "n", "t" }, "<M-_>", function()
	require("nvchad.term").toggle({ pos = "sp", size = 0.4, id = "split_window" })
end, { desc = "toggle horizontal terminal" })
map({ "n", "t" }, "<M-|>", function()
	require("nvchad.term").toggle({ pos = "vsp", size = 0.4, id = "vertical_split_window" })
end, { desc = "toggle vertical terminal" })

map("n", "<leader>kk", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "close current buffer" })
map("n", "<leader>ko", function()
	require("nvchad.tabufline").closeOtherBufs()
end, { desc = "close other buffers" })
map("n", "<leader>ka", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "close all buffers" })

map("n", "<M-s>", ":silent !open -R %:p<CR>", { desc = "Open in Finder" })

-- Visual mode
map("v", "A", ":normal A", { desc = "append to visual block" })

-- Open file out of current FS scope
map("n", "<leader>b", ":edit<CR>", { desc = "Edit file in new buffer" })

map("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hint" })

map("n", "<leader>df", function()
	vim.diagnostic.open_float()
end, { desc = "Show Line Diagnosics" })

vim.keymap.set("n", "<leader>dp", function()
	vim.diagnostic.goto_prev()
end, { desc = "Show Previous Diagnosics" })
vim.keymap.set("n", "<leader>dn", function()
	vim.diagnostic.goto_next()
end, { desc = "Show Next Diagnosics" })

-- always center search/nav results
vim.keymap.set("n", "n", "nzz", { desc = "find next and center screen", silent = true })
vim.keymap.set("n", "N", "Nzz", { desc = "find previous and center screen", silent = true })
vim.keymap.set("n", "*", "*zz", { desc = "highlight next and center screen", silent = true })
vim.keymap.set("n", "#", "#zz", { desc = "highlight previous and center screen", silent = true })
vim.keymap.set("n", "g*", "g*zz", { desc = "highlight all and center screen", silent = true })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "go half page up and center screen", silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "go half page down and center screen", silent = true })

-- LSP mappings
local function opts(_desc)
	return { desc = "LSP " .. _desc }
end
map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

map("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts("List workspace folders"))

map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
-- map("n", "<leader>ra", vim.lsp.buf.rename, opts("NvRenamer"))
map("n", "<leader>ra", require("nvchad.lsp.renamer"), opts("NvRenamer"))

map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
map("n", "gr", vim.lsp.buf.references, opts("Show references"))

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

map("n", "?", ":h ", opts("help"))
