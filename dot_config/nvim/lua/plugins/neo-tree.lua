return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    -- Others dependencies
    "saifulapm/neotree-file-nesting-config", -- add plugin as dependency. no need any other config or setup call
  },
  opts = {
    hide_root_node = true,
    retain_hidden_root_indent = true,
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    window = {
      position = "left",
      width = 60,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- 'thumbs.db',
          ".DS_Store",
        },
        never_show = {},
        never_show_by_pattern = { -- uses glob style patterns
          ".null-ls_*",
        },
      },
    },
  },
  config = function(_, opts)
    -- Adding rules from plugin
    opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
    require("neo-tree").setup(opts)
  end,
}
