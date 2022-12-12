local actions = require 'lir.actions'

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrwSettings = 0
vim.g.loaded_netrwFileHandlers = 0

require 'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.5)
      local height = math.floor(vim.o.lines * 0.5)
      return {
        border = {
          "┌", "─", "┐", "│", "┘", "─", "└", "│",
        },
        width = width,
        height = height,
        style = "minimal",
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
      }
    end,
  },
  hide_cursor = true,
  mappings = {
    ['l']    = actions.edit,
    ['s']    = actions.split,
    ['v']    = actions.vsplit,
    ['t']    = actions.tabedit,
    ['h']    = actions.up,
    ['q']    = actions.quit,
    ['K']    = actions.mkdir,
    ['N']    = actions.newfile,
    ['<F2>'] = actions.rename,
    ['Y']    = actions.yank_path,
    ['.']    = actions.toggle_show_hidden,
    ['D']    = actions.delete,
  },
}

local map = vim.api.nvim_set_keymap
map("n", "<C-b>", ":lua require'lir.float'.toggle()<CR>", { noremap = true, silent = true })
map("n", "<A-h>", ":edit %:h<CR>", { noremap = true, silent = true })
