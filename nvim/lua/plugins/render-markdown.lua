-- FIX: migrate good ui from obsidian.nvim
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  opts = {
    bullet = {
      icons = { "•", "○", "◆", "◇" },
    },
    checkbox = {
      enabled = true,
      unchecked = {
        icon = "󰄱",
      },
      checked = {
        icon = "",
      },
    },
    -- migrate this:
    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    -- colors?
    -- heading numbers look bad
  },
}
