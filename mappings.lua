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
  },
}

-- more keybinds!

return M
