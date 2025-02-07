return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("tokyonight").setup({
      -- use the night style
      style = "night",
    })
  end,
}
