return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = function()
		local actions = require('telescope.actions')

		return {
			defaults = {
				mappings = {
					i = {
						-- scroll preview window
						['<C-u>'] = actions.preview_scrolling_up,
						['<C-d>'] = actions.preview_scrolling_down,
					},
				},
			},
			extensions = {
				file_browser = {
					path = "%:p:h",
				},
			},
		}
	end
}
