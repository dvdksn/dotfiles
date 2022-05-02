local map = vim.api.nvim_set_keymap

-- Settings
require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	view = {
		side = "right",
		hide_root_folder = true,
		mappings = {
			list = {
				{ key = "<2-RightMouse>", action = "" }, -- remove default cd action
				{ key = "<C-o>", action = "cd" },
			},
		},
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
})
map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
map("n", "<C-f>", ":NvimTreeFindFile<CR>", { noremap = true })
map("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true })
