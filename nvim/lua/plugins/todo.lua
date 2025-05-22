return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    keywords = {
      -- would have been awesome to have '?' as alt-keyword but aight
      QUESTION = { icon = "?", color = "question", alt = { "Q" } },
    },
    colors = {
      --defaults
      -- TODO: change colors to my liking
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" }, --bug&fix
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" }, --hack&warn(ing)
      info = { "DiagnosticInfo", "#2563EB" }, --todo
      hint = { "DiagnosticHint", "#10B981" }, --note&info&perf
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" }, --test
      --new
      question = { "#0000FF" },
    },
  },
}
