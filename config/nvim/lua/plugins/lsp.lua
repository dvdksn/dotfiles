-- LSP-related config

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true



-- Generic on_attach
-- Do nothing, LSP mappings made generic...
local on_attach = function()
	local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_set_keymap

	map("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gp", '<Cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
	map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
	map("n", "<F2>", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

require("nvim-lsp-installer").setup({
	ensure_installed = {
		"bashls",
		"golangci_lint",
		"gopls",
		"html",
		"jsonls",
		"cssls",
		"pyright",
		"sumneko_lua",
		"svelte",
		"tsserver",
		"yamlls",
	},
	automatic_installation = true,
})

local null_ls = require("null-ls")

null_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	sources = {
		null_ls.builtins.diagnostics.vale,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
	},
})

lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.svelte.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		on_attach()
	end,
})
lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	},
})

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		on_attach()
	end,
})

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		on_attach()
	end,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		on_attach()
	end,
})
