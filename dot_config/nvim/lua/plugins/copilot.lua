return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
    init = function() vim.g.copilot_nes_debounce = 500 end,
  },
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
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
            ai_reject = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").dismiss()
                return true
              end
            end,
            ai_accept_word = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept_word()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
