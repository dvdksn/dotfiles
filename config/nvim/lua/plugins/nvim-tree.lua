-- lua/plugin/nvim-tree.lua

local g = vim.g
local map = vim.api.nvim_set_keymap
-- Settings
require("nvim-tree").setup{
  update_focused_file = {
    enable = true,
  },
  disable_netrw = true,
  update_cwd = true,
  view = {
    auto_resize = true
  }
}
map("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<C-f>", ":NvimTreeFindFile<CR>", {noremap = true})
map("n", "<leader>r", ":NvimTreeRefresh<CR>", {noremap = true})
