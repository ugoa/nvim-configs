return {
  {
    enabled = false,
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    lazy = false, -- neo-tree will lazily load itself
    branch = "v3.x",
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
      default_component_configs = {
        container = {
          enable_character_fade = false,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },

    keys = {
      {
        "<C-n>",
        mode = { "n" },
        "<cmd>Neotree filesystem reveal left toggle<CR>",
        desc = "Toggle File explorer",
      },
    },
  },

  {
    enabled = false,
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
          git_placement = "after",
          modified_placement = "signcolumn",
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
        show_on_open_dirs = false,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
    },

    keys = { { "<C-n>", "<cmd>NvimTreeToggle<CR>" } },
  },

  {
    enabled = false,
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<c-n>",
        "<cmd>Yazi cwd toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      yazi_floating_window_border = "single",
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
