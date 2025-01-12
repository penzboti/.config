-- i use packer btw
return require('packer').startup(function(use)
	use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end,
   'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
end)
-- :PackerSync
