return {
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	'numToStr/Comment.nvim',
	'lewis6991/gitsigns.nvim',
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
