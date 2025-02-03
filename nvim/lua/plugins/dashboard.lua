return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
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
            icon = "  ",
            desc = "Open Nvim config                        ",
            action = "tabnew $MYVIMRC | tcd %:p:h",
            key = "<Leader> c",
          },
          -- {
          -- 	icon = "  ",
          -- 	desc = "Open Nvim bindings                      ",
          -- 	action = "tabnew $MYVIMRC | tcd %:p:h | edit lua/mappings.lua",
          -- 	key = "<Leader> e b",
          -- },
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
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
