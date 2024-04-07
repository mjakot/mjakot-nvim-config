local M = {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	opts = {},
	config = function ()
		require("Comment").setup({
			toggler = {
				line = "<leader>kc",
				block = "<leader>jc"
			}
		})
	end
}

return { M }
