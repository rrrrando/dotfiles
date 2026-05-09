-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.comment.mini-comment" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.blade" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.bars-and-lines.wakastat" },
}
