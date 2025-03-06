local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local nls = require("null-ls")
nls.setup({
  debug = false,
  sources = {
    -- nls.builtins.code_actions.eslint_d,
    -- nls.builtins.diagnostics.eslint_d,
    -- nls.builtins.diagnostics.selene
    -- nls.builtins.diagnostics.tsc,
    -- nls.builtins.formatting.eslint_d,
    -- nls.builtins.formatting.stylua,
    nls.builtins.code_actions.eslint,
    nls.builtins.diagnostics.cfn_lint,
    nls.builtins.diagnostics.eslint,
    nls.builtins.diagnostics.fish,
    nls.builtins.diagnostics.golangci_lint,
    nls.builtins.diagnostics.jsonlint,
    nls.builtins.diagnostics.pylint,
    nls.builtins.diagnostics.rubocop,
    nls.builtins.diagnostics.shellcheck,
    -- nls.builtins.diagnostics.vale,
    nls.builtins.diagnostics.yamllint,
    nls.builtins.formatting.eslint,
    nls.builtins.formatting.gofumpt,
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.prettier,
    nls.builtins.formatting.rubocop,
    nls.builtins.formatting.rustfmt,
    nls.builtins.formatting.terraform_fmt,
    nls.builtins.hover.dictionary,
  },
  -- on_attach = function(client, bufnr)
  --     if client.supports_method("textDocument/formatting") then
  --         vim.api.nvim_clear_autocmds({
  --             group = augroup,
  --             buffer = bufnr
  --         })
  --         vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function ()
  --               vim.lsp.buf.format({ bufnr = bufnr })
  --             end
  --         })
  --     end
  --   end
})
