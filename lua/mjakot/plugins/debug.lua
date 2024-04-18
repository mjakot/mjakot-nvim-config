require 'utils'

local M = {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'codelldb',
      },
    }

    nmap('<F5>', dap.continue, 'Debug: Start/Continue')
    nmap('<F10>', dap.step_into, 'Debug: Step Into')
    nmap('<F11>', dap.step_over, 'Debug: Step Over')
    nmap('<F12>', dap.step_out, 'Debug: Step Out')
    nmap('<leader>b', dap.toggle_breakpoint, 'Debug: Toggle Breakpoint')

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '❚❚',
          play = '▶',
          step_into = '↓',
          step_over = '→',
          step_out = '↑',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '■',
          disconnect = 'x',
        },
      },
    }

    nmap('<F7>', dapui.toggle, 'Debug: See last session result')

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}

return { M }
