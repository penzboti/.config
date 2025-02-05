return {
  "epwalsh/obsidian.nvim",
  version = "*", -- this means latest version instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- this might not work on windows
    -- or if i change it, it might never work cross-platform
    -- i guess i have to make two different workspaces for the vaults
    -- that is if i sync them across
    workspaces = {
      {
        name = "personal",
        path = "~/obsidian/penzboti",
      },
      {
        name = "school",
        path = "~/obsidian/school",
      },
    },
    ui = { enable = false }, --note: it is not rendered while render-markdown
  },
}
