local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function ()
		require("telescope").setup()
		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
		vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
		vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
		vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})
	end
}

return { M }
