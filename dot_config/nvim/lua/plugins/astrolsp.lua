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
		local vtsls_config = {
			settings = {
				vtsls = {
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
							entriesLimit = 200,
						},
					},
					tsserver = {
						globalPlugins = {
							vue_plugin,
						},
					},
				},
				typescript = {
					suggest = {
						includeCompletionsForModuleExports = true,
						includeAutomaticOptionalChainCompletions = true,
					},
					preferences = {
						includePackageJsonAutoImports = "on",
						importModuleSpecifierPreference = "relative",
					},
				},
				javascript = {
					suggest = {
						includeCompletionsForModuleExports = true,
						includeAutomaticOptionalChainCompletions = true,
					},
					preferences = {
						includePackageJsonAutoImports = "on",
						importModuleSpecifierPreference = "relative",
					},
				},
			},
			filetypes = tsserver_filetypes,
		}

		local ts_ls_config = {
			init_options = {
				plugins = {
					vue_plugin,
				},
			},
			settings = {
				typescript = {
					suggest = {
						includeCompletionsForModuleExports = true,
						includeAutomaticOptionalChainCompletions = true,
					},
					preferences = {
						includePackageJsonAutoImports = "on",
						importModuleSpecifierPreference = "relative",
					},
				},
				javascript = {
					suggest = {
						includeCompletionsForModuleExports = true,
						includeAutomaticOptionalChainCompletions = true,
					},
					preferences = {
						includePackageJsonAutoImports = "on",
						importModuleSpecifierPreference = "relative",
					},
				},
			},
			filetypes = tsserver_filetypes,
		}

		local vue_ls_config = {
			on_init = function(client)
				client.handlers["tsserver/request"] = function(_, result, context)
					local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })

					if #clients == 0 then
						vim.notify(
							"Could not find `ts_ls` lsp client, `vue_ls` would not work without it.",
							vim.log.levels.ERROR
						)
						return
					end
					local ts_client = clients[1]

					local param = unpack(result)
					local id, command, payload = unpack(param)
					ts_client:exec_cmd({
						title = "vue_request_forward",
						command = "typescript.tsserverRequest",
						arguments = {
							command,
							payload,
						},
					}, { bufnr = context.bufnr }, function(_, r)
						local response = r and r.body
						local response_data = { { id, response } }

						---@diagnostic disable-next-line: param-type-mismatch
						client:notify("tsserver/response", response_data)
					end)
				end
			end,
		}

		opts.config = vim.tbl_deep_extend("force", opts.config or {}, {
			vtsls = vtsls_config,
			ts_ls = ts_ls_config,
			volar = vue_ls_config,

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

		-- Ensure servers are installed
		opts.mason_lspconfig = vim.tbl_deep_extend("force", opts.mason_lspconfig or {}, {
			ensure_installed = { "vue_ls", "vtsls", "ts_ls", "intelephense" },
		})

		return opts
	end,
}
