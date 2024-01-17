local plugins = {

  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/.nvim_sessions" },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    ft = { "python", "lua" },
    opts = function()
      return require "custom.configs.none-ls"
    end,
  },

  -- {
  --   "Pocco81/auto-save.nvim",
  --   lazy = false,
  --   opts = {
  --     trigger_events = {"InsertLeave", "TextChanged", "FocusLost"},
  --     write_all_buffers = true,
  --   }
  -- },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
        virt_text_priority = 700,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "pyright",
        "terraform-ls",
        "lua-language-server",
        "black",
        "ruff",
        "stylua",
      },
    },
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
      },
      renderer = {
        root_folder_label = ":~:s?$?",
        highlight_opened_files = "all",
      },
      view = {
        adaptive_size = true,
        width = {
          max = "35%",
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--no-ignore",
          "--glob=!.github/*",
          "--glob=!.cargo/*",
          "--glob=!.vscode/*",
          "--glob=!target/*",
          "--glob=!.idea/*",
        },
      },
    },
  },

  { "NvChad/nvterm", enabled = false },

  { "NvChad/nvim-colorizer.lua", enabled = false },
}

return plugins
