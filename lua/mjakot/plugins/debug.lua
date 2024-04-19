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
	-- stylua: ignore start
        command = vim.fn.stdpath('data') .. '\\mason\\bin\\codelldb.cmd',
        -- stylua: ignore end
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

    dapui.setup {
      icons = {
        expanded = '▾',
        collapsed = '▸',
        current_frame = '*',
      },
      mappings = {
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
      },
      expand_lines = true,
      layouts = {
        {
          elements = {
            'scopes',
          },
          size = 0.3,
          position = 'left',
        },
        {
          elements = {
            'repl',
            'breakpoints',
          },
          size = 0.3,
          position = 'bottom',
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = 'single',
        mappings = {
          close = {
            'q',
            '<Esc>',
          },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
        indent = 1,
      },
    }

    nmap('<F7>', dapui.toggle, 'Debug: [F7] See last session result')

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}

return { M }
