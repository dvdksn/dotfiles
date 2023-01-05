local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Generic on_attach
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_set_keymap

  map("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  map("v", "<space>f", "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "dockerls",
    "golangci_lint_ls",
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "tailwindcss",
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

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.dockerls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    on_attach(client, bufnr)
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
        globals = { "vim", "require" },
      },
    },
  },
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    on_attach(client, bufnr)
  end,
})
