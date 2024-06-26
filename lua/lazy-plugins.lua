require 'utils'

require('lazy').setup({
  plreq 'Comment-nvim',
  plreq 'gitsigns',
  plreq 'telescope',
  plreq 'lspconfig',
  plreq 'conform',
  plreq 'cmp',
  plreq 'kanagawa',
  plreq 'lualine',
  plreq 'treesitter',
  plreq 'indent-line',
  plreq 'vim-sleuth',
  plreq 'debug',
  plreq 'presence',
  plreq 'which-key',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {},
  },
})
