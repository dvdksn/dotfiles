return {
	'saghen/blink.cmp',
	-- use a release tag to download pre-built binaries
	version = '1.*',
	-- optional: provides snippets for the snippet source
	dependencies = { 'rafamadriz/friendly-snippets' },
	opts = {
		-- ensure you have the `snippets` source (enabled by default)
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		keymap = {
			preset = 'enter',
		},
		completion = {
			documentation = { auto_show = true },
			ghost_text = { enabled = true },
			-- Don't select by default, auto-insert on selection
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},
		},
		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" }
}
