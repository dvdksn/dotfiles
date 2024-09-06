-- Remove background color
vim.cmd [[ highlight Normal ctermbg=NONE guibg=NONE ]]

-- Use italic for comments
vim.api.nvim_set_hl(0, 'Comment', { italic = true, fg = "gray" })
