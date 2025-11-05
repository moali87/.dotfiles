vim.lsp.config('*', {
  root_markers = { '.git' },
})

local typescript = require('config.lsp.typescript')
vim.lsp.config.typescript = typescript
vim.lsp.enable('typescript')

local python = require('config.lsp.pylsp')
vim.lsp.config.python = python
vim.lsp.enable('python')

local gopls = require('config.lsp.gopls')
vim.lsp.config.gopls = gopls
vim.lsp.enable('gopls')
local go = require('config.lsp.golangci_lint_ls')
vim.lsp.config.go = go
vim.lsp.enable('go')

require('config.lsp.keymaps')
