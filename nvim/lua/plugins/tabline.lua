-- maybe bad but would be useful for harpoon?
return {
  "kdheepak/tabline.nvim",
  config = function()
    require("tabline").setup({
      enable = true,
      section_separators = { "", "" },
      component_separators = { "", "" },
      show_filename_only = false,
      modified_icon = "+ ",
    })
  end,
}
