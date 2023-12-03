local overrides = require "custom.configs.overrides"

local plugins = {

  -- lsp config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- nvcommunity
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.editor.rainbowdelimiters" },
    { import = "nvcommunity.editor.illuminate" },
    { import = "nvcommunity.folds.ufo" },
    { import = "nvcommunity.editor.biscuits" },
    { import = "nvcommunity.editor.symbols-outline" },
    { import = "nvcommunity.lsp.prettyhover" },
    { import = "nvcommunity.lsp.lsplines" },
    { import = "nvcommunity.completion.copilot" },
    {
      "copilot.lua",
      opts = {
        suggestion = {
          keymap = {
            accept = "<C-a>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      },
    },
    { import = "nvcommunity.git.neogit" },
    { import = "nvcommunity.editor.hlargs" },
    { import = "nvcommunity.diagnostics.trouble" },
    { import = "nvcommunity.lsp.dim" },
  },

  -- project manager
  {
    "charludo/projectmgr.nvim",
    lazy = false, -- important!
    config = function()
      require("projectmgr").setup {
        autogit = {
          enabled = true,
          command = "git pull --ff-only > .git/fastforward.log 2>&1",
        },
        session = { enabled = true, file = "Session.vim" },
        shada = { enabled = false, file = "main.shada" },
      }
    end,
  },

  -- nvim surrownd
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- dashboard is a plugin to show a dashboard when opening nvim
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        -- stylua: ignore start
        -- config
        config = {
          header = {
            '',
          '███████╗██╗  ██╗ ██████╗ ██╗   ██╗████████╗██╗ █████╗ ',
          '██╔════╝╚██╗██╔╝██╔═══██╗██║   ██║╚══██╔══╝██║██╔══██╗',
          '█████╗   ╚███╔╝ ██║   ██║██║   ██║   ██║   ██║███████║',
          '██╔══╝   ██╔██╗ ██║   ██║██║   ██║   ██║   ██║██╔══██║',
          '███████╗██╔╝ ██╗╚██████╔╝╚██████╔╝   ██║   ██║██║  ██║',
          '╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝   ╚═╝╚═╝  ╚═╝',
            'bnvim',
         },
        },
        theme = "hyper",
      }
      -- stylua: ignore end
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup {
        -- Animation style (see below for details)
        stages = "slide",
        -- Default timeout for notifications
        timeout = 5000,
        -- For stages that change opacity this is treated as the highlight behind the window
        background_colour = "#000000",
        -- Icons for the different levels
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      }
    end,
  },

  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        -- add any configuration options here
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = false,
          },
          signature = { enabled = false },
        },
        message = {
          enable = true,
          view_error = "message",
          -- view_error = "cmdline_output",
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          format = { cmdline = {
            icon = " ",
          } },
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
          {
            filter = {
              event = "emsg",
            },
            view = "split",
          },
        },
      }
    end,
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
      end
    end,
  },

  -- flash nvim for searching
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup {}
    end,
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-z>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  -- debuuger
  {
    "mfussenegger/nvim-dap",
  },

  -- debugger for cpp
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- debugger for python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path, opts)
      require("core.utils").load_mappings "dap_python"
    end,
  },

  -- debugger for go
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },

  -- gopher
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function()
      require("gopher").setup()
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- elixir-ls
  {

    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require "elixir"
      local elixirls = require "elixir.elixirls"

      elixir.setup {
        nextls = { enable = true },
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function()
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins

