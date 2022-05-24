local actions = require 'lir.actions'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

require 'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  float = {
    winblend = 15,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },
  },
  hide_cursor = true,
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,
    ['h']     = actions.up,
    ['q']     = actions.quit,
    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['<F2>']  = actions.rename,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,
  },
}

local map = vim.api.nvim_set_keymap
map("n", "<C-n>", ":lua require'lir.float'.toggle()<CR>", { noremap = true, silent = true })
map("n", "<C-h>", ":edit %:h<CR>", { noremap = true, silent = true })
