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
    -- Lua

    -- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
    -- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
    -- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
    -- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
    -- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
    -- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
  },
}

-- more keybinds!

return M
