---@diagnostic disable: lowercase-global

o = vim.opt

nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = 'Custom normal mode remap: ' .. desc })
end

plreq = function(plugin)
  return require('mjakot.plugins.' .. plugin)
end
