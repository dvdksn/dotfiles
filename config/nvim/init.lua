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

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'romgrk/barbar.nvim'
  use { 'blackcauldron7/surround.nvim', config = function() require('surround').setup{} end }
  use { 'folke/tokyonight.nvim', branch = 'main' }
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
  use 'mattn/emmet-vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'folke/trouble.nvim'
  use { 'tami5/lspsaga.nvim', config = function() require('lspsaga').init_lsp_saga{
    max_preview_lines = 20,
    border_style = 'round'
  } end }
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end }
  use 'windwp/nvim-ts-autotag'
  use 'yamatsum/nvim-cursorline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'ellisonleao/glow.nvim'
  use 'williamboman/nvim-lsp-installer'
end)

-- Color scheme:
g.tokyonight_dark_sidebar = false
cmd [[colorscheme tokyonight]]

require("maps")
require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/telescope")
require("plugins/lsp")
require("plugins/treesitter")
require("plugins/trouble")
require("plugins/barbar")
require("plugins/completion")

