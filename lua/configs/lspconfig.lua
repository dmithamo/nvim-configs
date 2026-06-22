local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults()

local servers = {
  "html",
  "cssls",
  "pyrefly",
  "dockerls",
  "bashls",
  "gopls",
  "rust_analyzer",
  "elixirls",
  "bash-language-server",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = vim.tbl_deep_extend("force", vim.lsp.config[lsp] or {}, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.enable(servers)

vim.lsp.config["ts_ls"] = vim.tbl_deep_extend("force", vim.lsp.config["ts_ls"] or {}, {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local deno_root = vim.fs.root(fname, { "deno.json", "deno.jsonc" })
    if deno_root then
      return
    end
    local node_root = vim.fs.root(fname, { "package.json", "tsconfig.json", ".git" })
    if node_root then
      on_dir(node_root)
    end
  end,
  single_file_support = false,
})

vim.lsp.config["denols"] = vim.tbl_deep_extend("force", vim.lsp.config["denols"] or {}, {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local deno_root = vim.fs.root(fname, { "deno.json", "deno.jsonc" })
    if deno_root then
      on_dir(deno_root)
    end
  end,
})

vim.lsp.config["angularls"] = vim.tbl_deep_extend("force", vim.lsp.config["angularls"] or {}, {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local angular_root = vim.fs.root(fname, { "angular.json", "nx.json" })
    if angular_root then
      on_dir(angular_root)
    end
  end,
})

vim.lsp.enable { "ts_ls", "denols", "angularls" }
