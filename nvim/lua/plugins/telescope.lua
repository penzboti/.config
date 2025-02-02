return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_next,
					["<C-l>"] = require("telescope.actions").move_selection_previous,
					["<C-j>"] = require("telescope.actions").select_default,
				},
			},
		},
	},
	-- config = require("telescope").setup({}),
}
