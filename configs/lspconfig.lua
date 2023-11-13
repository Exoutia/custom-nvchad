local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "clangd",
  "pylsp",
  "rust_analyzer",
  "jdtls",
  "tailwindcss",
  "emmet_ls",
  "eslint",
  "tsserver",
  "marksman",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        conifgurationSources = { "pycodestyle", "mypy" },
        pylsp_mypy = { enabled = true },
        flake8 = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        pyls_isort = { enabled = true },
        jedi_completion = { fuzzy = true },
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
