local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local function edit()
    local node = api.tree.get_node_under_cursor()
    local RootNode = require("nvim-tree.node.root")
    if node:as(RootNode) then return end
    api.node.open.edit()
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "-", "<Nop>", opts("Disable"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "<CR>", edit, opts("Edit or Expand or Dir-up"))
  vim.keymap.set("n", "l", edit, opts("Edit or Expand or Dir-up"))
end

return {
  "nvim-tree/nvim-tree.lua",
  tag = "v1.13.0",
  event = "VeryLazy",

  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree.lua#L237
  opts = {
    on_attach = on_attach,
    reload_on_bufenter = true,
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = true,
    filters = {
      enable = true,
      git_ignored = true,
      dotfiles = true,
      git_clean = false,
      no_buffer = false,
      no_bookmark = false,
      exclude = {
        ".gitignore",
        ".env.template",
        ".env.sample",
        ".dockerignore",
        ".gitlab",
        ".values",
        ".terraform",
      },
    },
    actions = {
      change_dir = {
        enable = false,
      },
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      update_cwd = false,
    },
    renderer = {
      root_folder_label = ":~:s?$?",
      highlight_opened_files = "all",
      icons = {
        -- git_placement = "after",
        modified_placement = "after",
      },
      indent_markers = {
        enable = false,
      },
      group_empty = true,
      full_name = true,
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "justfile" },
      -- hidden_display = "all",
    },
    view = {
      adaptive_size = true,
      signcolumn = "yes", --auto, yes or no
      cursorline = true,
      width = {
        max = "30%",
        min = "18%",
      },
    },
    system_open = {
      cmd = "open",
      args = { "-R" },
    },
    help = {
      sort_by = "desc",
    },
    git = {
      enable = false,
    },
    modified = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
    },
  },

  keys = { { "-", "<cmd>NvimTreeToggle<CR>" } },
}
