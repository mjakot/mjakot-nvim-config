local M = {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  theme = 'dragon',
  background = {
    dark = 'dragon',
  },
  init = function()
    vim.cmd.colorscheme 'kanagawa-dragon'
  end,
}

return { M }
