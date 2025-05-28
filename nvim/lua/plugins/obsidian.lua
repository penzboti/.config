-- Q: if you can disable the text on top of every markdown(obsidian) file
-- it might have to do sg with the formatter & templates

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
    workspaces = {
      {
        name = "cross-platform-school",
        path = function()
          return ObsidianPath("school")
        end,
      },
      {
        name = "no-vault",
        path = function()
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
          notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
          new_notes_location = "current_dir",
          templates = {
            folder = vim.NIL,
          },
          disable_frontmatter = true,
        },
      },
    },
    ui = {
      --note: it is not rendered while render-markdown
      enable = false,
      checkboxes = {
        -- we set this so we can easily toggle between only these two
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
      },
    },
  },
}
