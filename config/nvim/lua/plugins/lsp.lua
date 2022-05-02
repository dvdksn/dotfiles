-- LSP-related config

local lsp_installer = require("nvim-lsp-installer")

-- Prevent inline buffer annotations
vim.diagnostic.open_float()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Generic on_attach
local on_attach = function()
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }
	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gp", '<Cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
	map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap = true, silent = true })
	map("n", "<F2>", "<cmd>lua require('lspsaga.rename').rename()<CR>", { noremap = true, silent = true })
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
	map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

lsp_installer.on_server_ready(function(server)
	local opts = {}
	opts.on_attach = on_attach

	-- Customize the options passed to the server
	if server.name == "cssls" then
		opts.capabilities = capabilities
	end

	if server.name == "html" then
		opts.capabilities = capabilities
	end

	if server.name == "jsonls" then
		opts.flags = { debounce_text_changes = 150 }
		opts.capabilities = capabilities
		opts.commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		}
	end

	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	end

	server:setup(opts)
end)
