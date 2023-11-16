local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "java",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.telescope = {

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "debugloop/telescope-undo.nvim",
  },
  extenxions_list = { "workspaces", "fzf", "dap", "gh", "git_worktree", "undo" },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "tailwindcss-language-server",
    "emmet-ls",
    "eslint-lsp",
    "deno",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- markdown stuff
    "marksman",
    "ltex-ls",

    -- python stuff
    "python-lsp-server",
    "black",
    "mypy",

    -- rust stuff
    "rust-analyzer",

    -- java stuff
    "jdtls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    side = "right",
  },
}

return M
