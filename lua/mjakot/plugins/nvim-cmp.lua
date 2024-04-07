local M = {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			debounce = {
				100,
			},
			snippet = {
				expand = function(args)
				require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item(select_opts)
					else
						fallback()
					end
				end,
				{ "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item(select_opts)
					else
						fallback()
					end
				end,
				{ "i", "s" }),
				["<C- >j"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.mapping.scroll_doc(4)
					else
						fallback()
					end
				end,
				{ "i", "s" }),
				["<C- >k"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.mapping.scroll_doc(-4)
					else
						fallback()
					end
				end,
				{ "i", "s" }),
				["<C- >e"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", keyword_lenght = 6, group_index = 1, max_item_count = 30 },
				{ name = "luasnip", keyword_lenght = 6, group_index = 1, max_item_count = 30 },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" }
			})
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" }
			}
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" }
			}),
			matching = { disallow_symbol_nonprefix_matching = false }
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("lspconfig")["clangd"].setup({
			capabilities = capabilities
		})

		require("lspconfig")["lua_ls"].setup({
			capabilities = capabilities
		})
	end,
}

return { M }
