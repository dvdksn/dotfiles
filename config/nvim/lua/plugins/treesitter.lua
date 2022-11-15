-- Treesitter configuration

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
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
