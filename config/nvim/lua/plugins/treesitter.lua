-- Treesitter configuration

require("nvim-treesitter.configs").setup({
	ensure_installed = {
    "astro",
		"bash",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"graphql",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"markdown",
		"python",
		"regex",
		"scss",
		"svelte",
		"toml",
		"typescript",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
	},
	autotag = {
		enable = true,
	},
})
