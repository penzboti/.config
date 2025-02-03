return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            -- luckily they get replaced when in this context
            ["<A-k>"] = require("telescope.actions").move_selection_next,
            ["<A-l>"] = require("telescope.actions").move_selection_previous,
            ["<A-j>"] = require("telescope.actions").select_default,
            ["<A-c>"] = require("telescope.actions").close,
            -- if i dont feel using alt
            ["<C-k>"] = require("telescope.actions").move_selection_next,
            ["<C-l>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").select_default,
            -- ctrl-c is a default bind
          },
          n = {
            -- same on normal mode side
            ["<A-k>"] = require("telescope.actions").move_selection_next,
            ["<A-l>"] = require("telescope.actions").move_selection_previous,
            ["<A-j>"] = require("telescope.actions").select_default,
            ["<A-c>"] = require("telescope.actions").close,
            ["<C-k>"] = require("telescope.actions").move_selection_next,
            ["<C-l>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").select_default,
          },
        },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      },
    })
    require("telescope").load_extension("fzy_native")
  end,
}
