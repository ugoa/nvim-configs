return {
  "nvim-tree/nvim-tree.lua",
  tag = "v1.13.0",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },

  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree.lua#L237
  opts = {
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
        max = "25%",
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

  keys = { { "<C-n>", "<cmd>NvimTreeToggle<CR>" } },
}
