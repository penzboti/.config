local opt = vim.opt
-- opt.clipboard = 'unnamedplus' -- use system keyboard for yank

opt.nu = true
opt.relativenumber = true

-- Q: set tab size to 2 spaces
-- lets test it!
local o = vim.o
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
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
-- vim.opt.shell = "pwsh.exe" -- not for linux, please; Q: add pwsh alias?
