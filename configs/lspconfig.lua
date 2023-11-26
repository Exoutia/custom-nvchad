local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "clangd",
  "pylsp",
  "rust_analyzer",
  "tailwindcss",
  "emmet_ls",
  "eslint",
  "tsserver",
  "marksman",
  "gopls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.mod", ".git", "go.mod"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        conifgurationSources = { "flake8" },
        pylsp_mypy = { enabled = true },
        flake8 = { enabled = true, maxLineLength = 120 },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        pyls_isort = { enabled = true },
        jedi_completion = { fuzzy = true },
        rope_autoimport = { enabled = true },
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
