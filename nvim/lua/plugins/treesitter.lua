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
        "rust",
        "vimdoc",
        "markdown",
        "markdown_inline",
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
