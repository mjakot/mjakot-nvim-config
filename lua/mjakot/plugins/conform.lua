local M = {
	'stevearc/conform.nvim',
	lazy = false,
	keys = {
		{
			'<leader>fr',
			function ()
				require('conform').format {
					async = true,
					lsp_fallback = true
				}
			end,
			mode = '',
			desc = '[F]o[R]mat buffer'
		}
	},
	opts = {
		notify_on_error = false,
		format_on_save = function (bufnr)
			local disable_filetypes = { c = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
			}
		end,
		formatters_by_ft = {
			lua = { 'stylua' }
		}
	}
}

return { M }