return {
	"Saghen/blink.cmp",
	dependencies = {
		{ "adalessa/laravel.nvim" },
	},
	specs = {
		{ "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		completion = { list = { selection = { preselect = true, auto_insert = true } } },
		sources = {
			-- remember to enable your providers here
			default = { "laravel", "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					score_offset = 100,
				},
				snippets = {
					score_offset = -10,
				},
				laravel = {
					name = "laravel",
					module = "blink.compat.source",
					score_offset = 95, -- show at a higher priority than lsp
				},
			},
		},
	},
}
