return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  opts = {
    bullet = {
      icons = { "•" },
    },
    checkbox = {
      enabled = true,
      unchecked = {
        icon = "󰄱",
      },
      checked = {
        icon = "",
      },
      -- custom = { -- dont forget to also set this up in obsidian.lua THESE ARE NOT RENDERED IN NORMAL MD
      -- arrow = { raw = "[>]", rendered = "", highlight = "ObsidianRightArrow", scope_highlight = nil },
      -- tilde = { raw = "[~]", rendered = "󰰱", highlight = "ObsidianTilde", scope_highlight = nil },
      -- important = { raw = "[!]", rendered = "", highlight = "ObsidianImportant", scope_highlight = nil },
      -- },
    },
    heading = {
      icons = { "#1 ", "#2 ", "#3 ", "#4 ", "#5 ", "#6 " },
      position = "inline",
    },
    pipe_table = {
      alignment_indicator = "|",
      preset = "heavy",
    },
    link = {
      custom = {
        youtube = { pattern = "youtu%.be", icon = "󰗃 " },
        web = { pattern = "^http", icon = " " },
      },
    },
  },
}
