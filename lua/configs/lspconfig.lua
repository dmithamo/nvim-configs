local nvlsp = require("nvchad.configs.lspconfig")

nvlsp.defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "pyrefly",
  "dockerls",
  "bashls",
  "gopls",
  "rust_analyzer",
  "angularls",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = vim.tbl_deep_extend("force", vim.lsp.config[lsp] or {}, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.enable(servers)
