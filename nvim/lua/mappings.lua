vim.keymap.set({'n','v'},'j','h')
vim.keymap.set({'n','v'},'k','j')
vim.keymap.set({'n','v'},'l','k')
vim.keymap.set({'n','v'},'é','l')

vim.g.mapleader = " "
vim.keymap.set('n',"<leader>w",":w<enter>")
vim.keymap.set('n',"<leader>q",":q<enter>")
vim.keymap.set('n',"<leader>pv",":Ex<enter>")

vim.keymap.set("n", "<A-k>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-l>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-l>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv") -- move line down(v)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set("n", "<space>s", require("nvim-tree.api").tree.toggle, {
  silent = true,
  desc = "toggle nvim-tree",
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.keymap.set("n", "<leader>d", ":Dashboard<CR>")
