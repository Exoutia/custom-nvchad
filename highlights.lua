-- To find any highlight groups: "<cmd> Telescope highlights"high
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  NoiceFormatTitle = { fg = "base30", bold = true },
  NoiceCmdlinePopup = {
    italic = true,
  },
  NoiceCmdlinePopupBorder = {
    fg = "base30",
  },
  Flashlabel = {
    bg = "green",
    fg = "darker_black",
    bold = true,
  },
}

return M
