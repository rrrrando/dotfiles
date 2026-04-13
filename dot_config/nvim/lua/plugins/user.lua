-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {},
      dim = {},
      image = {},
      dashboard = {
        preset = {
          header = table.concat({
            "                          ░░░▒▒▓▓████████████████████████████████████▓▓▒▒░░░                          ",
            "             ░▒▒▓▓█████████████████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓█████████████████▓▓▒░░               ",
            "             ░██████▓▒▒░░░                                              ░░░▒▓▓█████▓                ",
            "               ▓███░                                                          ▓███░                 ",
            "                ░███▓                                                        ▒██▒                   ",
            "                  ▒███▒                                                                             ",
            "                   ░████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░                      ",
            "                     ▒██████████████████████████████████████████████████████                        ",
            "                                                                      ▒███▒                         ",
            "                                                                    ░▓██▓                           ",
            "                                                                   ▓███░                            ",
            "                           ░██████████████████████████████       ░███▓                              ",
            "                             ▓██████████████████████████▒       ▓███░                               ",
            "                              ░███▓                ▓██▓       ░███▓                                 ",
            "                                ▓███░             ░██░       ▓███░                                  ",
            "                                 ░███▓                     ▒███▒                                    ",
            "                                   ▓███░                  ▓███░                                     ",
            "                                    ░▓██▓               ▒███▒                                       ",
            "                                      ▒███▒           ░▓██▓                                         ",
            "                                        ▓███░        ▓███░                                          ",
            "                                         ░███▓     ░███▓                                            ",
            "                                           ▓███░  ▓███░                                             ",
            "                                            ░███▓███▓                                               ",
            "                                              ▓████░                                                ",
            "                                               ░█▓                                                  ",
          }, "\n"),
        },
      },
    },
  },

  { "wakatime/vim-wakatime", lazy = false },
}
