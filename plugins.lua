local plugins = {

  {
    "NvChad/nvterm",
    enabled = false,
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
        "terraform-ls"
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
        dotfiles = false,
      },
      renderer = {
        root_folder_label = ":~:s?$?",
        highlight_opened_files = "all",
      },
      view = {
        adaptive_size = true,
        width = {
          max = "35%"
        }
      },
    },
  },
}
return plugins

