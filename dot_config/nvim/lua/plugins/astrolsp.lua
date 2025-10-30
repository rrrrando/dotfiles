return {
  "AstroNvim/astrolsp",
  opts = function(_, opts)
    local vue_language_server_path = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }
    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      filetypes = tsserver_filetypes,
    }

    opts.config = vim.tbl_deep_extend("force", opts.config or {}, {
      ts_ls = ts_ls_config,
      vue_ls = {},

      intelephense = {
        settings = {
          intelephense = {
            single_file_support = true,
            completion = {
              maxItems = 200,
            },
          },
        },
      },
    })

    opts.formatting = {
      disabled = {
        "intelephense",
      },
    }

    -- Ensure both servers are installed
    opts.mason_lspconfig = vim.tbl_deep_extend("force", opts.mason_lspconfig or {}, {
      ensure_installed = { "vue_ls", "vtsls", "intelephense" },
    })

    return opts
  end,
}
