---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },          -- set global limits for large files for disabling features like treesitter
      autopairs = true,                                          -- enable autopairs at start
      cmp = true,                                                -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true,                                       -- highlight URLs at start
      notifications = true,                                      -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = {              -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true,     -- sets vim.opt.number
        spell = false,     -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false,      -- sets vim.opt.wrap
        fileformats = "unix,dos,mac",
        fixendofline = false,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        ["<C-s>"] = { ":wa!<cr>", desc = "Save all Files" },
        -- navigate buffer tabs
        ["]b"] = {
          function()
            require("astrocore.buffer").nav(vim.v.count1)
          end,
          desc = "Next buffer",
        },
        ["[b"] = {
          function()
            require("astrocore.buffer").nav(-vim.v.count1)
          end,
          desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(function(bufnr)
              require("astrocore.buffer").close(bufnr)
            end)
          end,
          desc = "Close buffer from tabline",
        },

        ["<leader>gi"] = {
          function()
            Snacks.picker.gh_issue()
          end,
          desc = "GitHub Issues (open)",
        },
        ["<leader>gI"] = {
          function()
            Snacks.picker.gh_issue({ state = "all" })
          end,
          desc = "GitHub Issues (all)",
        },
        ["<leader>gp"] = {
          function()
            Snacks.picker.gh_pr()
          end,
          desc = "GitHub Pull Requests (open)",
        },
        ["<leader>gP"] = {
          function()
            Snacks.picker.gh_pr({ state = "all" })
          end,
          desc = "GitHub Pull Requests (all)",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>L"] = { desc = "Laravel" },
        ["gf"] = {
          function()
            local ok, res = pcall(function()
              if Laravel.app("gf").cursorOnResource() then
                return "<cmd>lua Laravel.commands.run('gf')<cr>"
              end
            end)
            if not ok or not res then
              return "gf"
            end
            return res
          end,
          noremap = false,
          expr = true,
        },
        ["<Leader>."] = {
          function()
            Snacks.scratch()
          end,
          desc = "Toggle Scratch Buffer",
        },
        ["<Leader>bS"] = {
          function()
            Snacks.scratch.select()
          end,
          desc = "Select Scratch Buffer",
        },
        ["<Leader>fz"] = {
          function()
            require("chezmoi.pick").snacks()
          end,
          desc = "Find Chezmoi files",
        },
        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      i = {
        ["<C-s>"] = { "<esc>:wa!<cr>", desc = "Save all Files" },
      },
    },
  },
}
