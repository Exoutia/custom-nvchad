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
  py_path = vim.g.python3_host_prog
end

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
  "elixirls",
  "jdtls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

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

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        conifgurationSources = { "flake8" },
        pylsp_mypy = {
          enabled = true,
          overrides = { "--python-executable", py_path, true },
          report_progress = true,
          live_mode = false,
        },
        flake8 = { enabled = true, maxLineLength = 120 },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        pyls_isort = { enabled = true },
        jedi_completion = { fuzzy = true },
        rope_autoimport = { enabled = false },
        pydocstyle = { enabled = false, maxLineLength = 120 },
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
