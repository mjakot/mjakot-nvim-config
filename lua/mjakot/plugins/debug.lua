require 'utils'

local M = {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    {
      'rcarriga/nvim-dap-ui',
      opts = {},
    },
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

    dap.cpp = {
      codelldb = {
        {
          type = 'cpp',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
        },
      },
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb.cmd',
        args = { '--port', '${port}' },
        detached = false,
      },
    }

    nmap('<F5>', dap.continue, 'Debug: [F5] Start/Continue')
    nmap('<F10>', dap.step_into, 'Debug: [F10] Step Into')
    nmap('<F11>', dap.step_over, 'Debug: [F11] Step Over')
    nmap('<F12>', dap.step_out, 'Debug: [F12] Step Out')
    nmap('<leader>b', dap.toggle_breakpoint, 'Debug: Toggle [B]reakpoint')
    nmap('<leader>cb', function()
      dap.clear_breakpoints()
    end, 'Debug: [C]lear [B]reakpoints')
    nmap('<leader>x', function()
      dap.clear_breakpoints()
      dap.terminate()
    end, 'Debug: [X] Terminate Debugging and Clear Breakpoints')
    nmap('<F7>', dapui.toggle, 'Debug: [F7] See last session result')

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}

return { M }
