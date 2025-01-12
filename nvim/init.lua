-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.keymap.set({'n','v'},'j','h')
vim.keymap.set({'n','v'},'k','j')
vim.keymap.set({'n','v'},'l','k')
vim.keymap.set({'n','v'},'é','l')

vim.g.mapleader = " "

vim.keymap.set('n',"<leader>w",":w<enter>")
vim.keymap.set('n',"<leader>q",":q<enter>")
vim.keymap.set('n',"<leader>pv",":Ex<enter>")

vim.api.nvim_command('source ~/.config/nvim/.vimrc')

vim.o.relativenumber = true
vim.o.number = true
    
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.opt.termguicolors = true

-- require'nvim-tree'.setup() {}
-- vim.keymap.set('n',"<leader>e",function() 
--   if ( require'nvim-tree.view'.is_visible() )
--   then
--     return ":NvimTreeToggle<enter>"
--   else
--     return ":NvimTreeFocus<enter>"
-- end
-- )
-- vim.keymap.set('n',"<leader>e",":NvimTreeFocus<enter>:NvimTreeToggle<enter>")
vim.keymap.set('n',"<leader>e", ":NvimTreeToggle<enter>" )

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'numToStr/Comment.nvim'
    -- use 'nvim-tree/nvim-tree.lua'
    -- config = function()
    --   require('nvim-tree').setup()
    -- end
    use { 
      'prichrd/netrw.nvim',
      'echasnovski/mini.icons'
    }
    use 'nvim-treesitter/nvim-treesitter'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { { 'nvim-lua/plenary.nvim'} }
    }
    config = function()
      require('Comment').setup()
      -- lol imagine working 
      require('netrw').setup({
        icons = {
          symlink = '',
          directory = '',
          file = '',
        },use_devicons = true
      })
    end
    config()
    
end)
