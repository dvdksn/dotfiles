-- Treesitter configuration

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.cue = {
  install_info = {
    url = "https://github.com/eonpatapon/tree-sitter-cue", -- local path or git repo
    files = {"src/parser.c", "src/scanner.c"},
    branch = "main"
  },
  filetype = "cue", -- if filetype does not agrees with parser name
}

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "cue",
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
    "rust",
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
