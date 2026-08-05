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

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      require "configs.lint"
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
        "c",
        "cpp",
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
        "pyright",
        "ruff",
        "dprint",
        "prettier",
        "prettierd",
        "angular-language-server",
        "denotat-denols",
        "deno",
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

  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
