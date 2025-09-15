return {
  "AstroNvim/astrolsp",
  opts = function(_, opts)
    -- Get the path to the vue language server plugin
    local vue_language_server_path = vim.fn.stdpath "data"
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }

    -- vtsls config as per vuejs wiki
    opts.config = vim.tbl_deep_extend("force", opts.config or {}, {
      vtsls = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = { vue_plugin },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      },
      volar = {
        on_init = function(client)
          client.handlers["tsserver/request"] = function(_, result, context)
            local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = "vtsls" }
            if #clients == 0 then
              vim.notify("Could not find `vtsls` lsp client, `vue_ls` would not work without it.", vim.log.levels.ERROR)
              return
            end
            local ts_client = clients[1]
            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
              title = "vue_request_forward",
              command = "typescript.tsserverRequest",
              arguments = { command, payload },
            }, { bufnr = context.bufnr }, function(_, r)
              local response_data = { { id, r.body } }
              client:notify("tsserver/response", response_data)
            end)
          end
        end,
      },
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

    -- Ensure both servers are installed
    opts.mason_lspconfig = vim.tbl_deep_extend("force", opts.mason_lspconfig or {}, {
      ensure_installed = { "vue_ls", "vtsls", "intelephense" },
    })

    -- opts.formatting.format_on_save = false

    return opts
  end,
}
