return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  requires = {
    "copilotlsp-nvim/copilot-lsp",
    init = function() vim.g.copilot_nes_debounce = 500 end,
  },
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
    nes = {
      enabled = true, -- requires copilot-lsp as a dependency
      keymap = {
        accept_and_goto = "<leader>p",
        accept = false,
        dismiss = "<Esc>",
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
            ai_next = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").next()
                return true
              end
            end,
            ai_prev = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").prev()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
