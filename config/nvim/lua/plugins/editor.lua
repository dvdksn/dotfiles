return {
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	'numToStr/Comment.nvim',
	'tpope/vim-sleuth',
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		}
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle [O]utline" },
		},
		opts = {},
	},
}
