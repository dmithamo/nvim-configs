local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local nvlsp = require("nvchad.configs.lspconfig")

local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/nvim/jdtls-workspace/" .. project_name

local config = {
  cmd = {
    "jdtls",
    "-data", workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      saveActions = {
        organizeImports = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = home .. "/.sdkman/candidates/java/11.0.21-tem",
          },
          {
            name = "JavaSE-17",
            path = home .. "/.sdkman/candidates/java/17.0.9-tem",
            default = true,
          },
          {
            name = "JavaSE-21",
            path = home .. "/.sdkman/candidates/java/21.0.1-tem",
          }
        }
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*",
          "org.mockito.Mockito.*",
          "org.mockito.ArgumentMatchers.*",
          "org.mockito.Answers.*",
        },
      },
    },
  },
}

jdtls.start_or_attach(config)
