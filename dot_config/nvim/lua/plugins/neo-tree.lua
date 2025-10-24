return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_by_name = {
					".git",
					".DS_Store",
					"node_modules/",
				},
				always_show_by_pattern = {
					".env*",
				},
				never_show = {},
				never_show_by_pattern = {
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
