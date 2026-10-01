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
    opts = function()
      -- Fetch NvChad's base treesitter options safely
      local opts = require "nvchad.configs.treesitter"

      -- Ensure ensure_installed exists as a table
      opts.ensure_installed = opts.ensure_installed or {}

      -- List of your custom languages to add
      local custom_langs = {
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
        "make",
      }

      -- Append custom languages to NvChad's defaults without overwriting them
      for _, lang in ipairs(custom_langs) do
        if not vim.tbl_contains(opts.ensure_installed, lang) then
          table.insert(opts.ensure_installed, lang)
        end
      end

      return opts
    end,
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
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
