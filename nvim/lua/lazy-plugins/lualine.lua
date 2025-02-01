return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      -- theme = "onedark",
      theme = "auto",
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {
        -- 'encoding', 
        -- 'fileformat', 
        'filetype'
      },
      -- lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    extensions = { "quickfix", "fugitive", "nvim-tree" },
  }
}
