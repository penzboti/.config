-- https://github.com/jdhao/nvim-config
-- https://github.com/nvim-lua/kickstart.nvim

vim.g.mapleader = " "

require("utils")
require("lazy_init")
require("set")
require("formatting")
require("mappings")

-- vim.cmd.color("tokyonight")
vim.cmd.color("rose-pine")
