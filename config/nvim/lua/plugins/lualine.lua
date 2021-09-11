-- lua/plugins/lualine.lua

-- Settings
require("lualine").setup {
  options = {
    theme = "tokyonight"
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
    },
    lualine_y = {"filetype"},
    lualine_z = {"location"}
  }
}
