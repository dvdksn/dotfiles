-- lua/plugin/treesitter.lua

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
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
    enable = true,
  },
  autotag = {
    enable = true,
  }
}
