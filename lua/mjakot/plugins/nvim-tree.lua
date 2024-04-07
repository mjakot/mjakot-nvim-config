local M = {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = { adaptive_size = true },
			git = { ignore = false },
		})

		vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
		vim.keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		vim.keymap.set("n", "<leader>fu", function ()
			require("nvim-tree.api").tree.expand_all()
		end, { desc = "Expand whole tree" })
		vim.keymap.set("n", "<leader>fi", function ()
			require("nvim-tree.api").tree.collapse_all()
		end, { desc = "Collapse whole tree" })
	end,
}

return { M }
