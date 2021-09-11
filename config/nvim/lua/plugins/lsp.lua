-- lua/plugins/lsp.lua

-- Prevent inline buffer annotations
vim.lsp.diagnostic.show_line_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  cssls = {
    capabilities = capabilities,
  },
  dockerls = {},
  graphql = {},
  gopls = {},
  html = {
    capabilities = capabilities,
  },
  jsonls = {
    capabilities = capabilities,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
  },
  pyright = {},
  svelte = {},
  tsserver = {},
  yamlls = {},
}

-- Generic on_attach
local on_attach = function(client, bufnr)
  local map = vim.api.nvim_set_keymap
  local opts = { noremap=true, silent=true }
  map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map('n', '<leader>b', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', '<leader>w', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

for name, settings in pairs(servers) do
  if type(settings) == "function" then
    opts()
  else
    local client = require("lspconfig")[name]
    client.setup {
      flags = { debounce_text_changes = 150 },
      on_attach = on_attach,
      settings
    }
  end
end
