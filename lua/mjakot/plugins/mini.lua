local M = {
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
    }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.selection_location = function()
      return '%12:%-2v'
    end
  end,
}

return { M }
