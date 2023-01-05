vim.g.mapleader = ","
vim.wo.number = true
vim.b.autoindent = true
vim.b.smartindent = true
vim.g.smarttab = true
vim.g.magic = true
vim.o.termguicolors = true
vim.o.hidden = true
vim.g.encoding = "utf-8"
vim.o.cmdheight = 1
vim.wo.signcolumn = "yes"
vim.o.updatetime = 300
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.b.textwidth = 72
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.g.do_filetype_lua = 1
vim.wo.scrolloff = 5
vim.o.splitright = true

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("kyazdani42/nvim-web-devicons")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use("jose-elias-alvarez/null-ls.nvim")
  use("folke/trouble.nvim")
  use({
    "tami5/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga({
        max_preview_lines = 10,
        border_style = "round",
        code_action_prompt = {
          sign = false,
        },
      })
    end,
  })
  use {
    "nvim-lualine/lualine.nvim",
  }
  use("tamago324/lir.nvim")
  use("EdenEast/nightfox.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use("L3MON4D3/LuaSnip")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use 'simrat39/rust-tools.nvim'
end)

require("mason").setup()

-- Color scheme:
require("nightfox").setup({
  palettes = {
    carbonfox = {
      comment = "cyan"
    }
  }
})
vim.cmd("colorscheme carbonfox")

-- autocmds

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local aug_default = augroup("AugDefault", {})

autocmd({ "BufEnter" }, {
  group = aug_default,
  pattern = "*.md",
  command = "set nowrap"
})

require("maps")
require("plugins.completion")
require("plugins.errors")
require("plugins.lir")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.snippets")
require("plugins.telescope")
require("plugins.treesitter")
