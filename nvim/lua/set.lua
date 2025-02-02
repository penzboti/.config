local opt = vim.opt
-- opt.clipboard = 'unnamedplus' -- use system keyboard for yank

opt.nu = true -- set line numbers
opt.relativenumber = true -- use relative line numbers

-- set tab size to 2 spaces
-- for some reason lua still uses tabs?
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = true

opt.incsearch = true -- incremental search

opt.termguicolors = true
