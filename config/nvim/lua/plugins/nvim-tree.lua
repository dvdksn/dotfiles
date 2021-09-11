-- lua/plugin/nvim-tree.lua

local g = vim.g
local map = vim.api.nvim_set_keymap
-- Settings
g.nvim_tree_side = "right"
g.nvim_tree_ignore = { ".git", "node_modules" }
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_highlight_opened_files = 1
map("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<C-f>", ":NvimTreeFindFile<CR>", {noremap = true})
map("n", "<leader>r", ":NvimTreeRefresh<CR>", {noremap = true})
