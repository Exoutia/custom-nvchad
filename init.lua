-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove Nerd Font:h11"
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 1
  vim.g.neovide_padding_left = 0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.o.mouse = "nv"
  vim.g.neovide_transparency = 0.8
end
vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept('\<CR>')]]
vim.g.copilot_no_tab_map = true
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.g.dashboard_default_executive = "telescope"
vim.o.mouse = "nv"
-- vim.cmd [[
-- augroup kitty_mp
--     autocmd!
--     au VimLeave * :silent !kitty @ set-spacing padding=15
--     au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
-- augroup END
-- ]]😆
-- Lua
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
  require("trouble").toggle "workspace_diagnostics"
end)
vim.keymap.set("n", "<leader>xd", function()
  require("trouble").toggle "document_diagnostics"
end)
vim.keymap.set("n", "<leader>xq", function()
  require("trouble").toggle "quickfix"
end)
vim.keymap.set("n", "<leader>xl", function()
  require("trouble").toggle "loclist"
end)
vim.keymap.set("n", "gR", function()
  require("trouble").toggle "lsp_references"
end)
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
