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

local yamlls = require('config.lsp.yamlls')
vim.lsp.config.yamlls = yamlls
vim.lsp.enable('yamlls')

vim.diagnostic.config({
    signs = true, -- Shows signs in the gutter
    update_in_insert = false, -- Don't update diagnostics while in insert mode
    severity_sort = true, -- Sort diagnostics by severity
    virtual_lines = true,
})


require('config.lsp.keymaps')
