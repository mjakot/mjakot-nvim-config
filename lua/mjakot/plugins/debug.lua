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

    dapui.setup()

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'codelldb',
        'cppdbg',
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

    dap.adapters.gdb = {
      type = 'executable',
      command = 'gdb',
      args = { '-i', 'dap' },
    }

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/bin/OpenDebugAD7.cmd',
      options = {
        detached = false,
      },
    }

    dap.configurations.cpp = {
      {
        name = 'Debug with cpptools',
        type = 'cppdbg',
        request = 'launch',
        program = function()
          return vim.fn.input {
            promt = 'Path to debug executable: ',
            default = vim.fn.getcwd() .. '\\',
            completion = 'file',
          }
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      {
        type = 'gdb',
        name = 'Debug with gdb',
        request = 'launch',
        program = function()
          return vim.fn.input {
            promt = 'Path to debg executable: ',
            default = vim.fn.getcwd() .. '\\',
            completion = 'file',
          }
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = 'Debug with codelldb',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input {
            promt = 'Path to debug executable: ',
            default = vim.fn.getcwd() .. '\\',
            completion = 'file',
          }
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

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
  end,
}

return { M }
