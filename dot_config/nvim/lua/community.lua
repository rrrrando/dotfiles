-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
	{ import = "astrocommunity.motion.mini-surround" },
	{ import = "astrocommunity.motion.mini-ai" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.blade" },
	{ import = "astrocommunity.bars-and-lines.wakastat" },
	{ import = "astrocommunity.color.twilight-nvim" },
	{ import = "astrocommunity.recipes.picker-lsp-mappings" },
	{ import = "astrocommunity.git.octo-nvim" },
	{ import = "astrocommunity.ai.opencode-nvim" },
	-- import/override with your plugins folder
}
