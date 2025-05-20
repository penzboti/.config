local opt = vim.opt
-- opt.clipboard = 'unnamedplus' -- use system keyboard for yank

opt.nu = true
opt.relativenumber = true

-- Q: set tab size to 2 spaces
local o = vim.o
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.mousemoveevent = true -- i wont use a mouse, but just in case

opt.wrap = true

opt.incsearch = true -- incremental search (?)

opt.termguicolors = true

opt.conceallevel = 2 -- obsidian.nvim

-- it used cmd on windows (not good)
-- this approach is also not cross-compatable
vim.opt.shell = "pwsh.exe"
