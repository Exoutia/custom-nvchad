local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local venv_path = os.getenv "VIRTUAL_ENV"
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
  py_path = venv_path .. "/bin/python3"
else
  py_path = "/usr/bin/python"
end

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "emmet_ls",
  "eslint",
  "tsserver",
  "marksman",
  "gopls",
  "elixirls",
  "jdtls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = on_attach,

  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig.html.setup {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "htmldjango" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  settings = {},
  single_file_support = true,
}

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "elixir-ls" },
  filetypes = { "elixir", "eelixir" },
}

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

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        autoImportCompletions = true,
      },
    },
  },
}

-- lspconfig.pylsp.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         conifgurationSources = { "ruff" },
--         pylsp_mypy = {
--           enabled = true,
--           overrides = { "--python-executable", py_path, true },
--           report_progress = true,
--           live_mode = false,
--         },
--         flake8 = { enabled = false, maxLineLength = 120 },
--         maccabe = { enabled = false },
--         pyflakes = { enabled = false },
--         pylint = { enabled = false },
--         ruff = { enabled = true, lineLength = 120 },
--         yapf = { enabled = false },
--         pyls_isort = { enabled = true },
--         jedi_completion = { fuzzy = true },
--         pydocstyle = { enabled = false, maxLineLength = 120 },
--         pycodefolding = { enabled = true },
--         pycodestyle = { enabled = false },
--       },
--     },
--   },
-- }

--
-- lspconfig.pyright.setup { blabla}
