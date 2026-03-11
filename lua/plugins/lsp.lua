local capabilities = require('blink.cmp').get_lsp_capabilities()

-- ---------------------------------------------------------
--                   Global LSP Config
-- ---------------------------------------------------------
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- ---------------------------------------------------------
--                   Per-Server Config
-- ---------------------------------------------------------
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = { globals = { 'vim' } },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('zls', {
  cmd = { 'zls' },
  capabilities = capabilities,
})

-- ---------------------------------------------------------
--                   Enable Servers
-- ---------------------------------------------------------
vim.lsp.enable({
  'gopls',
  'ts_ls',
  'pyright',
  'zls',
  'clangd',
  'ols',
  'lua_ls',
})

-- ---------------------------------------------------------
--                   Diagnostics (Error Lens)
-- ---------------------------------------------------------
vim.diagnostic.config({
  virtual_text = {
    prefix = '■',
    spacing = 4,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = false,
})
