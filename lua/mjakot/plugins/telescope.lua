require 'utils'

local M = {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end
		},
		'nvim-telescope/telescope-ui-select.nvim',
		{
			'nvim-tree/nvim-web-devicons',
			enabled = vim.g.have_nerd_fond
		}
	},
	config = function()
		require('telescope').setup {
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown()
				}
			}
		}

		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		local builtin = require 'telescope.builtin'

		nmap('<leader>fh', builtin.help_tags, '[F]ind [H]help')
		nmap('<leader>fw', builtin.grep_string, '[F]ind [W]ord')
		nmap('<leader>fd', builtin.diagnostics, '[F]ind [D]iagnostics')
		nmap('<leader>ff', builtin.oldfiles, '[F]ind [F]iles')
		nmap('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')

		nmap('<leader>/', function()
			builtin.current_buffer_fuzzy_find(requrie('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false
			})
		end, '[/] Find in current buffer')

		nmap('<leader>f/', function()
			builtin.live_grep {
				grep_open_files = true,
				promt_title = 'Live Grep in Open Files'
			}
		end, '[F]ind [/] in Open Files')

		nmap('<leader>fc', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, '[F]ind [C]onfig files')
	end
}

return { M }
