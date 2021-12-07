-- lua/maps.lua

local map = vim.api.nvim_set_keymap

-- Move lines:
map("n", "<A-j>", ":m .+1<CR>==", {noremap = true})
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true})
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true})
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true})

-- Open a new tab
map("n", "<leader>t", ":tabnew ", { noremap = true})

-- Close current tab
map("n", "<leader>c", ":tabclose", { noremap = true})

-- j/k will move virtual lines (lines that wrap)
map("", "j", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true})
map("", "k", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true})

-- Copy/paste selection in visual mode
map("v", "<leader>y", "*y", { noremap = true })
map("v", "<leader>p", "*p", { noremap = true })

-- Unbinds
map("", "<F1>", "<nop>", {})
map("", "q", "<nop>", { noremap = true })
