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

-- test ctrl-é
-- vim.keymap.set('n',"<C-é>",function() print("a") end)

-- alt+j & alt+k
--TODO: make the selection come back
vim.api.nvim_command('source ~/.config/nvim/.vimrc')

vim.o.relativenumber = true
vim.o.number = true

vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.opt.termguicolors = true

local config = function()
  vim.cmd("colorscheme rose-pine")

  require('Comment').setup()

  require('netrw').setup({
    icons = {
      symlink = '',
      directory = '',
      file = '',
    },use_devicons = true
  })

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

  local mark = require "harpoon.mark"
  local ui = require "harpoon.ui"
  local term = require "harpoon.term"
  vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, {})
  vim.keymap.set("n", "<leader>a", mark.add_file, {})
  vim.keymap.set("n", "<C-j>", ui.nav_next, {})
  vim.keymap.set("n", "<C-k>", ui.nav_prev, {})
  vim.keymap.set("n", "<C-t>", function()
    term.gotoTerminal(1)
  end)

  require("lsp-zero").setup()
  vim.opt.signcolumn = 'yes'

  local lspconfig_defaults = require('lspconfig').util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  require('mason').setup({})
  require('mason-lspconfig').setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "clangd"
    },
    automatic_installation = true,
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
  })

  local luasnip = require("luasnip")
  local cmp = require('cmp')
  cmp.setup({
    sources = cmp.config.sources({
      {name = 'nvim_lsp'},
      {name = 'luasnip'},
    }, {
      { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
      -- Navigate between completion items
      ['<C-l>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      ['<C-k>'] = cmp.mapping.select_next_item({behavior = 'select'}),

      -- accept selection (or if not selected, the first option)
      ["<C-Space>"] = cmp.mapping.confirm({select = false}),
      ['<C-j>'] = cmp.mapping.confirm({select = true}),
      -- what doesnt work FOR SOME REASON
      ["<C-é>"] = cmp.mapping.confirm({select = true}),
      -- test ctrl-é WHICH WORKS
      -- ['<C-é>'] = { function() print("a") end,},

      -- Ctrl+h to trigger completion menu
      ['<C-h>'] = cmp.mapping.complete(),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      -- multiple tab in snippets
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),

      -- tab back in snippets
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      -- accepts snippets (i think)
      ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if luasnip.expandable() then
            luasnip.expand()
          else
            cmp.confirm({
              select = true,
            })
          end
        else
          fallback()
        end
      end),

    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })
end

-- apparently this would allow the commandline to autocomplete
-- which it already does? and if i allow it, it doesnt?
-- weird
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   }),
--   matching = { disallow_symbol_nonprefix_matching = false }
-- })

-- i have no idea what this does.
-- i think it connets cmd to the lsp buuuut it already does that
-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'LSP actions',
--   callback = function(event)
--     ---
--     -- code omitted for brevity...
--     ---
--   end,
-- })


-- packer setup
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'numToStr/Comment.nvim'
  use { 
    'prichrd/netrw.nvim',
    'echasnovski/mini.icons'
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim'} }
  }
  use "tpope/vim-fugitive"
  use "ThePrimeagen/harpoon"
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = { {
      -- LSP support
      'neovim/nvim-lspconfig',

      -- Autocompletetion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    } }
  }
  use {
    'williamboman/mason.nvim',
    requires = { {
      'williamboman/mason-lspconfig.nvim',
      'nvim-lua/plenary.nvim',
    } },
  }
  use 'rose-pine/neovim'

  config()
end)
-- should be the last thing
