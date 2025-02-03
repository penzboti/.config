return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "│" },
    },
    word_diff = true,
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Actions
      map("n", "<leader>hp", require("gitsigns").preview_hunk)
      map("n", "<leader>hb", function()
        require("gitsigns").blame_line({ full = true })
      end)
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
      map("n", "<leader>td", gitsigns.toggle_deleted)
      map("n", "<leader>tw", gitsigns.toggle_word_diff)
      map("n", "<leader>hi", gitsigns.preview_hunk_inline)
    end,
  },
}
