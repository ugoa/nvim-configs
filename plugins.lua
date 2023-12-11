local plugins = {

  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
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
        },
      },
    },
  },
}

return plugins

