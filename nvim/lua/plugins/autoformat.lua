return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't have a well standardized coding style.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = "never"
      else
        lsp_format_opt = "fallback"
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      html = { "prettierd", "prettier", "html_beautify", stop_after_first = true },
      css = { "prettierd", "prettier", "stylelint", stop_after_first = true },
      javascript = { "prettierd", "prettier", "standardjs", stop_after_first = true },
      json = { "prettierd", "prettier", "fixjson", stop_after_first = true },
    },
  },
}
