-- General mappings

local map = vim.api.nvim_set_keymap

-- Move lines:
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- j/k will move virtual lines (lines that wrap)
map("", "j", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true })
map("", "k", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true })

-- Unbind F1 help
map("", "<F1>", "<nop>", {})

map("n", "<A-,>", ":bp<CR>", { noremap = true, silent = true })
map("n", "<A-.>", ":bn<CR>", { noremap = true, silent = true })

map("n", "<leader>qq", ":q<CR>", { noremap = true})
map("n", "<leader>qa", ":qa<CR>", { noremap = true})
map("n", "<leader>wqq", ":wq<CR>", { noremap = true})
map("n", "<leader>wqa", ":wqa<CR>", { noremap = true})
