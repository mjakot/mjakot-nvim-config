local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'c',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'cpp',
      'python',
      'c_sharp',
    },
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end,
}

return { M }
