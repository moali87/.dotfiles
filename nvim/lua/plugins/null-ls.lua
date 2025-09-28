return {
    "nvimtools/none-ls.nvim",
    -- event = "LazyFile",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
        local nls = require("null-ls")
        opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
        opts.sources = vim.list_extend(opts.sources or {}, {
            nls.builtins.diagnostics.fish,
            nls.builtins.diagnostics.gitlint,
            nls.builtins.diagnostics.golangci_lint,
            nls.builtins.diagnostics.ktlint,
            nls.builtins.diagnostics.rubocop,
            nls.builtins.diagnostics.terraform_validate,
            nls.builtins.diagnostics.tfsec,
            nls.builtins.diagnostics.todo_comments,
            nls.builtins.diagnostics.trail_space,
            nls.builtins.diagnostics.yamllint,
            nls.builtins.formatting.fish_indent,
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.shfmt,
            nls.builtins.formatting.gofumpt,
            nls.builtins.formatting.goimports,
            nls.builtins.formatting.golines,
            nls.builtins.formatting.ktlint,
            nls.builtins.formatting.packer,
            nls.builtins.formatting.prettierd,
            nls.builtins.formatting.pyink,
            nls.builtins.formatting.rubocop,
            nls.builtins.formatting.terraform_fmt,
            nls.builtins.hover.dictionary,
            nls.builtins.hover.printenv,
        })
    end,
}
