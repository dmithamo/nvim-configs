return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "java",
        "go",
        "rust",
        "python",
        "angular",
      },
      highlight = {
        enable = true,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "typescript-language-server",
        "html-lsp",
        "eslint_d",
        "jdtls",
        "gopls",
        "rust-analyzer",
        "pyrefly",
        "black",
        "dprint",
        "prettier",
        "prettierd",
        "angular-language-server",
      },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 40,
      },
    },
  },
}
