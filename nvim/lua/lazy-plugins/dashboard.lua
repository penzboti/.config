return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "doom",
      shortcut_type = "number",
      config = {
        header = {
          "                                                       ",
          "                                                       ",
          "                                                       ",
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
          "                                                       ",
          "                                                       ",
          "                                                       ",
          "                                                       ",
        },

        center = {
          {
            icon = "󰈞  ",
            desc = "Find  File                              ",
            -- action = "Leaderf file --popup",
            key = "<Leader> f f",
          },
          {
            icon = "󰈢  ",
            desc = "Recently opened files                   ",
            -- action = "Leaderf mru --popup",
            key = "<Leader> f r",
          },
          {
            icon = "󰈬  ",
            desc = "Project grep                            ",
            -- action = "Leaderf rg --popup",
            key = "<Leader> f g",
          },
          {
            icon = "  ",
            desc = "Open Nvim config                        ",
            action = "tabnew $MYVIMRC | tcd %:p:h",
            key = "<Leader> e v",
          },
          {
            icon = "  ",
            desc = "New file                                ",
            action = "enew",
            key = "e",
          },
          {
            icon = "󰗼  ",
            desc = "Quit Nvim                               ",
            -- desc = "Quit Nvim                               ",
            action = "qa",
            key = "q",
          },
        }
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
