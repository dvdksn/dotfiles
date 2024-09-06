return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			mappings = {
				i = {
					-- scroll preview window
					['<C-u>'] = require('telescope.actions').preview_scrolling_up,
					['<C-d>'] = require('telescope.actions').preview_scrolling_down,
				},
			},
		},
		extensions = {
			file_browser = {
				path = "%:p:h",
			},
		},
	},
	config = function()
	end
}
