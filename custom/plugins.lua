local plugins = {
  {
    "neovim/nvim-lspconfig",
  },

  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end
  },

  "mfussenegger/nvim-dap",

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
      },
      renderer = {
        root_folder_label = ":~:s?$?",
        highlight_opened_files = "all",
      },
    },
  }
}
return plugins
