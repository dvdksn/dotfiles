return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	lazy = false,
	opts = function()
		-- See `:help nvim-treesitter`
		require('nvim-treesitter.configs').setup {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = {
				'awk',
				'bash',
				'css',
				'dockerfile',
				'go',
				'gomod',
				'gosum',
				'hcl',
				'json',
				'jsonc',
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'toml',
				'vim',
				'vimdoc',
				'yaml',
			},
			highlight = { enable = true },
			indent = { enable = false },
		}
	end
}
