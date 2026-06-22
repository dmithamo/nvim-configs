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
  "angularls",
  "elixirls",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = vim.tbl_deep_extend("force", vim.lsp.config[lsp] or {}, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.enable(servers)

-- 2. Configure ts_ls to only run in Node/Frontend projects
vim.lsp.config["ts_ls"] = vim.tbl_deep_extend("force", vim.lsp.config["ts_ls"] or {}, {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- Only start if package.json exists, and NOT if deno.json exists
  root_dir = function(filename, bufnr)
    local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
    if deno_root then
      return nil
    end
    return vim.fs.root(bufnr, { "package.json", "tsconfig.json", ".git" })
  end,
  single_file_support = false,
})

-- 3. Configure denols to only run in Deno projects
vim.lsp.config["denols"] = vim.tbl_deep_extend("force", vim.lsp.config["denols"] or {}, {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- Only start if deno.json or deno.jsonc exists
  root_dir = function(filename, bufnr)
    return vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
  end,
})

-- 4. Enable both explicit configurations
vim.lsp.enable { "ts_ls", "denols" }
