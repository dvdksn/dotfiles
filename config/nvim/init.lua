local g = vim.g
local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd

g.mapleader = ","
w.number = true
b.autoindent = true
b.smartindent = true
g.smarttab = true
g.magic = true
o.termguicolors = true
o.hidden = true
g.encoding = "utf-8"
o.cmdheight = 1
w.signcolumn = "yes"
g.updatetime = 300
g.nobackup = true
g.nowritebackup = true
b.textwidth = 72
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("hoob3rt/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("romgrk/barbar.nvim")
  use({ "folke/tokyonight.nvim", branch = "main" })
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use("lukas-reineke/indent-blankline.nvim")
  use("neovim/nvim-lspconfig")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("folke/trouble.nvim")
  use({
    "tami5/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga({
        max_preview_lines = 10,
        border_style = "round",
        code_action_prompt = {
          virtual_text = false,
        },
      })
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use("windwp/nvim-ts-autotag")
  use("yamatsum/nvim-cursorline")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("ellisonleao/glow.nvim")
  use("williamboman/nvim-lsp-installer")
  use("jose-elias-alvarez/null-ls.nvim")
  use("onsails/lspkind.nvim")
  use("L3MON4D3/LuaSnip")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("gpanders/editorconfig.nvim")
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)

-- Color scheme:
g.tokyonight_dark_sidebar = false
cmd([[colorscheme tokyonight]])

require("maps")
require("plugins.completion")
require("plugins.errors")
require("plugins.lsp")
require("plugins.statusline")
require("plugins.tabline")
require("plugins.telescope")
require("plugins.nvimtree")
require("plugins.snippets")
require("plugins.treesitter")
