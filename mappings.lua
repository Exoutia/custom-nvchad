---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>gn"] = { "<cmd> Neogit<CR>", "neogit open" },
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Project Manager" },
    ["<C-i>"] = { "<cmd>lua require('notify').dismiss()<CR>", "dismiss notification" },
    ["<leader>tb"] = { "<cmd>lua require('base46').toggle_transparency()<CR>", "togggle transparency" },
    ["<leader>fu"] = { "<CMD>Telescope undo<CR>", "Find undo" },

    -- for trouble plugin
    ["<leader>xx"] = { "<cmd>lua require('trouble').toggle()<CR>", "toggle trouble" },
    ["<leader>xw"] = {
      "<cmd>lua require('trouble').toggle('workspace_diagnostics')<CR>",
      "toggle workspace diagnostics",
    },
    ["<leader>xd"] = { "<cmd>lua require('trouble').toggle('document_diagnostics')<CR>", "toggle document diagnostics" },
    ["<leader>xq"] = { "<cmd>lua require('trouble').toggle('quickfix')<CR>", "toggle quickfix" },
    ["<leader>xl"] = { "<cmd>lua require('trouble').toggle('loclist')<CR>", "toggle location list" },
    ["gR"] = { "<cmd>lua require('trouble').toggle('lsp_references')<CR>", "toggle LSP references" },

    -- for debugger
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "add break point" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "add break point",
    },

    -- for zenmode
    ["<leader>zz"] = { "<cmd> ZenMode<CR>", "toggle zen mode" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "debug test method",
    },
    ["<leader>dpl"] = {
      function()
        require("dap-python").debug_last()
      end,
      "rerun last debug",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "rerun last debug",
    },
  },
}

-- more keybinds!

return M
