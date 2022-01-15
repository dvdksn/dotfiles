local g = vim.g
local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd

g.mapleader = ","
w.number = true
b.autoindent = true
b.smartindent = true
b.shiftwidth = 2
b.tabstop = 2
b.expandtab = true
g.smarttab = true
g.magic = true
o.completeopt = "menu,menuone,noinsert,noselect"
o.termguicolors = true
o.hidden = true
g.encoding="utf-8"
o.cmdheight=2
w.signcolumn="yes"
g.updatetime=300
g.nobackup=true
g.nowritebackup=true
b.textwidth=72
vim.opt.shortmess:append({ c = true })

cmd [[autocmd filetype plugin indent on]]
cmd [[autocmd Filetype * setlocal ts=2 sw=2 expandtab]]

-- VimPlug
cmd [[
call plug#begin('~/.vim/plugged')
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'romgrk/barbar.nvim'
  Plug 'blackcauldron7/surround.nvim'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'mattn/emmet-vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'folke/trouble.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'yamatsum/nvim-cursorline'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'ellisonleao/glow.nvim'
  Plug 'williamboman/nvim-lsp-installer'
call plug#end()
]]

-- Color scheme:
g.tokyonight_dark_sidebar = false
cmd [[colorscheme tokyonight]]

-- Plugin initializaiton
require("gitsigns").setup()
require("nvim-autopairs").setup{}
require("surround").setup{}
require("lspsaga").init_lsp_saga{
  max_preview_lines = 20,
  border_style = "round"
}

require("maps")
require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/telescope")
require("plugins/lsp")
require("plugins/treesitter")
require("plugins/trouble")
require("plugins/barbar")
require("plugins/completion")

