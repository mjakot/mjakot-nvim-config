require 'utils'

nmap('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')
nmap('<C-C>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')

nmap('[d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
nmap(']d', vim.diagnostic.goto_prev, 'Go to next [D]iagnostic message')
nmap('<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror message')
nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

nmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
nmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
nmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
nmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

nmap('<C-d>', '<C-d>zz', 'Scroll [D]own half page and center cursor')
nmap('<C-u>', '<C-u>zz', 'Scroll [U]p half page and center cursor')
