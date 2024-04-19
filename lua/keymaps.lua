require 'utils'

nmap('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')
nmap('<C-C>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')

nmap('<leader>nd', vim.diagnostic.goto_next, 'Go to [N]ext [D]iagnostic message')
nmap('<leader>pd', vim.diagnostic.goto_prev, 'Go to [P]revious [D]iagnostic message')
nmap('<leader>ed', vim.diagnostic.open_float, 'Show [E]rror message [D]iagnostic')
nmap('<leader>qd', vim.diagnostic.setloclist, 'Open [Q]uickfix list [D]iagnostic')

nmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
nmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
nmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
nmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

nmap('<C-d>', '<C-d>zz', 'Scroll [D]own half page and center cursor')
nmap('<C-u>', '<C-u>zz', 'Scroll [U]p half page and center cursor')
