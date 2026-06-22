local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "deno" },
  typescript = { "deno" },
  javascriptreact = { "deno" },
  typescriptreact = { "deno" },
}

-- Trigger linting on save and text changes
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    -- Only run the deno linter if a deno config file is present
    if vim.fs.root(0, { "deno.json", "deno.jsonc" }) then
      lint.try_lint()
    end
  end,
})
