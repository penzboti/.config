vim.opt.sessionoptions = {
  "buffers",
  "tabpages",
  "globals",
}

return {
  "https://github.com/tiagovla/scope.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("scope").setup({})
    require("telescope").load_extension("scope")
  end,
}
