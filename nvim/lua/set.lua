local opt = vim.opt
-- opt.clipboard = 'unnamedplus' -- use system keyboard for yank

opt.nu = true -- set line numbers
opt.relativenumber = true -- use relative line numbers

-- set tab size to 2 spaces
local o = vim.o
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true

opt.wrap = true

opt.incsearch = true -- incremental search

opt.termguicolors = true
