local opt = vim.opt
-- opt.clipboard = 'unnamedplus' -- use system keyboard for yank

opt.nu = true
opt.relativenumber = true

-- set tab size to 2 spaces
local o = vim.o
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true

opt.wrap = true

opt.incsearch = true -- incremental search

opt.termguicolors = true

opt.conceallevel = 2 -- obsidian.nvim
