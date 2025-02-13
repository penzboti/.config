-- huh this works btw
-- vim.opt.foldmethod = "expr"

-- :h vim.treesitter.foldexpr()
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- ref: https://github.com/neovim/neovim/pull/20750
-- vim.opt.foldtext = ""
-- vim.opt.fillchars:append("fold: ")

-- Open all folds by default, zm is not available
-- vim.opt.foldlevelstart = 99

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- and after build you gotta
  -- or maybe not
  -- nix shell nixpkgs#gcc --command nvim -c TSUpdate
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "html",
        "css",
        "rust",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "nix",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ignore_install = { "javascript" },
      modules = {},
    })
  end,
}
