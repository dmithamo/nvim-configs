local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    
    javascript = { "dprint" },
    typescript = { "dprint" },
    javascriptreact = { "dprint" },
    typescriptreact = { "dprint" },
    json = { "dprint" },
    
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    
    python = { "black" }, 
    rust = { "rustfmt" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
