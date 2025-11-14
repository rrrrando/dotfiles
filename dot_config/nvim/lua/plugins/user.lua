---@type LazySpec
return {
	-- customize dashboard options
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			gh = {},
			image = {},
			scratch = {},
			picker = {
				matcher = {
					frecency = true,
				},
				sort = {
					fields = { "score:desc", "#text", "idx" },
				},
			},
			scroll = {},
			terminal = {},
			dashboard = {
				preset = {
					header = table.concat({
						" █████  ███████ ████████ ██████   ██████ ",
						"██   ██ ██         ██    ██   ██ ██    ██",
						"███████ ███████    ██    ██████  ██    ██",
						"██   ██      ██    ██    ██   ██ ██    ██",
						"██   ██ ███████    ██    ██   ██  ██████ ",
						"",
						"███    ██ ██    ██ ██ ███    ███",
						"████   ██ ██    ██ ██ ████  ████",
						"██ ██  ██ ██    ██ ██ ██ ████ ██",
						"██  ██ ██  ██  ██  ██ ██  ██  ██",
						"██   ████   ████   ██ ██      ██",
					}, "\n"),
				},
			},
		},
	},
	{ "wakatime/vim-wakatime", lazy = false },
}
