-- =========================
-- LSP KEYMAPS
-- =========================
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  nmap('K', vim.lsp.buf.hover, 'Hover')
  nmap('gD', vim.lsp.buf.declaration, 'Declaration')

  local telescope = require('telescope.builtin')
  nmap('gr', telescope.lsp_references, 'References')
  nmap('gi', telescope.lsp_implementations, 'Implementations')
  nmap('<leader>ds', telescope.lsp_document_symbols, 'Document Symbols')
end

-- =========================
-- CAPABILITIES (nvim-cmp)
-- =========================
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- =========================
-- NEODEV (Lua)
-- =========================
require('neodev').setup()

-- =========================
-- LSP SERVERS (NEW API)
-- =========================
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('pyright', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('ruff', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('gopls', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('html', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('svelte', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('tailwindcss', {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- =========================
-- ENABLE SERVERS
-- =========================
vim.lsp.enable({
  'lua_ls',
  'pyright',
  'ruff',
  'gopls',
  'rust_analyzer',
  'html',
  'svelte',
  'tailwindcss',
})

-- =========================
-- CMP
-- =========================
local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
})

