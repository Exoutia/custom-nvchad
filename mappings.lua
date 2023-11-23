---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>gn"] = { "<cmd> Neogit<CR>", "neogit open" },
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Project Manager" },
    ["<C-i>"] = { "<cmd>lua require('notify').dismiss()<CR>", "dismiss notification" },
    ["<leader>tb"] = { "<cmd>lua require('base46').toggle_transparency()<CR>", "togggle transparency" },
    ["<leader>fu"] = { "<CMD>Telescope undo<CR>", "Find undo" },

    ["<leader>xx"] = { "<cmd>lua require('trouble').toggle()<CR>", "toggle trouble" },
    ["<leader>xw"] = {
      "<cmd>lua require('trouble').toggle('workspace_diagnostics')<CR>",
      "toggle workspace diagnostics",
    },
    ["<leader>xd"] = { "<cmd>lua require('trouble').toggle('document_diagnostics')<CR>", "toggle document diagnostics" },
    ["<leader>xq"] = { "<cmd>lua require('trouble').toggle('quickfix')<CR>", "toggle quickfix" },
    ["<leader>xl"] = { "<cmd>lua require('trouble').toggle('loclist')<CR>", "toggle location list" },
    ["gR"] = { "<cmd>lua require('trouble').toggle('lsp_references')<CR>", "toggle LSP references" },
  },
}

-- more keybinds!

return M
