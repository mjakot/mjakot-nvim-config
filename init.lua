require("mjakot.mappings")
require("mjakot.lazy")
require("mjakot.lspconfig")

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.shortmess:append({ I = true })

vim.cmd([[set guicursor=i:blinkoff200-blinkon200,i:ver25]])

vim.cmd([[set tabstop=2]])
vim.cmd([[set softtabstop=-1]])
vim.cmd([[set shiftwidth=0]])

vim.cmd([[set cursorline]])
vim.cmd([[set cursorlineopt=number]])

vim.cmd([[set spell spelllang=en_us]])
