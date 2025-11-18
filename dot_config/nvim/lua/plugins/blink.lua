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
		sources = {
			default = { "laravel", "lsp", "path", "snippets", "buffer" },
			providers = {
				laravel = {
					name = "laravel",
					module = "blink.compat.source",
					score_offset = 100,
				},
			},
		},
	},
}
