local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    -- Dynamically choose between deno_fmt and dprint
    javascript = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "dprint" }
    end,

    typescript = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "dprint" }
    end,

    javascriptreact = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "dprint" }
    end,

    typescriptreact = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "dprint" }
    end,

    json = function(bufnr)
      if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
        return { "deno_fmt" }
      end
      return { "dprint" }
    end,

    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },

    python = { "black" },
    rust = { "rustfmt" },

    elixir = { "mix" },
    heex = { "mix" },
    eex = { "mix" },

    kotlin = { "ktlint" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
