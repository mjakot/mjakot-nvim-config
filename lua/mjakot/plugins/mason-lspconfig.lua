local M = {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd" }
		})
	end,
}

return { M }
