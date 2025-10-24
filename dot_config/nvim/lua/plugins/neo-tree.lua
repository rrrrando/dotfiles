return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					--".git",
					--".DS_Store",
					--"node_modules/",
				},
				never_show = {},
				never_show_by_pattern = { -- uses glob style patterns
					".null-ls_*",
				},
			},
		},
		window = {
			position = "left",
			width = 60,
		},
	},
}
