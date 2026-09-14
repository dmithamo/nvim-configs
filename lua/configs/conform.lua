local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    toml = { "taplo" },
    elixir = { "mix" },
    eelixir = { "mix" },
    heex = { "mix" },
    go = { "goimports", "gofmt" },

    javascript = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "biome" }
    end,

    typescript = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "biome" }
    end,

    javascriptreact = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "biome" }
    end,

    typescriptreact = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "biome" }
    end,

    json = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "biome" }
    end,

    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
  },

  formatters = {
    mix = {
      command = "mix",
      args = { "format", "-" },
      stdin = true,
    },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
