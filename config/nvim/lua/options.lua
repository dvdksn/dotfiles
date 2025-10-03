-- [[ Setting options ]]
-- See `:help vim.o`

-- Search/substitute
vim.o.hlsearch = false
vim.o.inccommand = "split"
-- Case insensitive searching UNLESS /C or capital in query
vim.o.ignorecase = true
vim.o.smartcase = true

-- Show line numbers and relative numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- File history
vim.o.undofile = true
vim.o.swapfile = false

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Set window scroll padding
vim.o.scrolloff = 5

-- Line wrapping
vim.o.wrap = true
vim.o.linebreak = true
vim.o.colorcolumn = "80"
vim.o.more = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noselect"

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Magic mode!
vim.o.magic = true
