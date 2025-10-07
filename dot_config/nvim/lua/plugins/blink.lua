return {
  {
    "Saghen/blink.cmp",
    dependencies = {
      { "adalessa/laravel.nvim" },
    },
    specs = {
      { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
    },
    opts = {
      keymap = {
        preset = "enter",
      },
      sources = {
        -- remember to enable your providers here
        default = { "laravel", "lsp", "path", "snippets", "buffer" },
        providers = {
          laravel = {
            name = "laravel",
            module = "blink.compat.source",
            score_offset = 95, -- show at a higher priority than lsp
          },
        },
      },
    },
  },
}
