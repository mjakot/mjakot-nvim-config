require 'utils'

require('lazy').setup({
  plreq 'Comment-nvim',
  plreq 'gitsigns',
  plreq 'telescope',
  plreq 'lspconfig',
  plreq 'conform',
  plreq 'cmp',
  plreq 'kanagawa',
  plreq 'todo-comments',
  plreq 'mini',
  plreq 'treesitter',
  plreq 'indent-line',
  plreq 'vim-sleuth',
  plreq 'debug',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {},
  },
})
