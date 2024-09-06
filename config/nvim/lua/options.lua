-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Show line numbers and relative numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Set window scroll padding
vim.o.scrolloff = 5

-- Disable line wrapping
vim.o.wrap = false

-- Colors & styles
vim.o.termguicolors = true
vim.o.colorcolumn = "80"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Magic mode!
vim.o.magic = true
