require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'gopls',
    'lua_ls',
    'ts_ls',
    'pyright',
    'clangd',
    'ols',
  },
  automatic_installation = true,
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'stylua',
  },
})
