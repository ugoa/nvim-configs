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
