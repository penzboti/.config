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
            action = "Telescope find_files",
            key = "<Leader> f f",
          },
          {
            icon = "󰈞  ",
            desc = "Open Buffers                            ",
            action = "Telescope buffers",
            key = "<Leader> f b",
          },
          {
            icon = "  ",
            desc = "Open Nvim config                        ",
            action = "tabnew $MYVIMRC | tcd %:p:h",
            key = "<Leader> c",
          },
          -- TODO: make a bindings help file
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
