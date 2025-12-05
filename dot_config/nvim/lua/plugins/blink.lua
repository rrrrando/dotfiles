return {
	"Saghen/blink.cmp",
	dependencies = {
		{ "adalessa/laravel.nvim" },
	},
	specs = {
		{ "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
	},
	---@module 'blink.cmp'
	---@type function|blink.cmp.Config
	opts = function(_, opts)
		if not opts.keymap then
			opts.keymap = {}
		end
		opts.sources.providers.laravel = {
			name = "laravel",
			module = "blink.compat.source",
			score_offset = 100,
		}
		opts.keymap["<Tab>"] = {
			function()
				if vim.g.ai_accept then
					return vim.g.ai_accept()
				end
			end,
			"fallback",
		}
		opts.keymap["<S-Tab>"] = { "fallback" }
	end,
}
