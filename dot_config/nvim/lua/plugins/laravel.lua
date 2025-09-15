return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>La", ":Laravel artisan<cr>" },
      { "<leader>Lr", ":Laravel routes<cr>" },
      { "<leader>Lm", ":Laravel make<cr>" },
    },
    event = { "VeryLazy" },
    opts = {
      features = {
        pickers = {
          enabled = true,
          provider = "snacks",
        },
      },
      lsp_server = "intelephense",
      environments = {
        env_variable = "NVIM_LARAVEL_ENV",
        auto_discover = false,
        default = "herd",
      },
    },
    config = true,
  },
}
