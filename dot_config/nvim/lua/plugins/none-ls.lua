return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.temp_dir = "/tmp"
    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.diagnostics.phpstan.with({
        extra_args = { "--memory-limit", "2G" },
      }),
    })
    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.formatting.prettierd.with({
        extra_args = { "--config", ".prettierrc" },
      }),
    })
    return opts
  end,
}
