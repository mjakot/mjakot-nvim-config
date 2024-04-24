require 'utils'

local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    {
      'folke/neodev.nvim',
      opts = {},
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('mjakot-lsp-attach', { clear = true }),
      callback = function(_)
        nmap('gd', require('telescope.builtin').lsp_definitions, 'LSP: [G]oto [D]efinitions')
        nmap('gr', require('telescope.builtin').lsp_references, 'LSP: [G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, 'LSP: [G]oto [I]mplementation')
        nmap('gD', vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration')
        nmap('<leader>fs', require('telescope.builtin').lsp_document_symbols, 'LSP: [F]ind [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'LSP: [W]orkspace [S]ymbols')
        nmap('<leader>fd', require('telescope.builtin').lsp_type_definitions, 'LSP: [F]ind [D]efinition')
        nmap('<leader>rn', vim.lsp.buf.rename, 'LSP: [R]e[N]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction')
        nmap('K', vim.lsp.buf.hover, 'LSP: [ K] Hover Documentation')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('mason').setup()

    local servers = {
      clangd = {},
      pyright = {},
      omnisharp_mono = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}

return { M }
