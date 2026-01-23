-- Define the configuration for the "yamlls" language server
return  {
    cmd = { "yaml-language-server", "--stdio" }, -- Command to start the server
    filetypes = { "yaml" }, -- File types the server should attach to
    root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git", "*.yaml" }, { upward = true })[1]) or vim.fn.getcwd(), -- Detect project root
    settings = {
        -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
        redhat = { telemetry = { enabled = false } },
        yaml = {
            inlayHints = { enable = true, key = true, keyVar = true },
            format = { enable = true },
            -- Example: add schema mapping for a Kubernetes config
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                -- Add more schema mappings here if needed
            },
            validate = true,
            hover = true,
            -- Add other YAML-specific settings here
        },
    },
    -- on_attach = function(client, bufnr)
    --     -- Optional: Add buffer-local keybindings when the LSP client attaches
    --     -- See :help lsp-attach for more details
    --     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    --     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
    --     -- Add other keymaps here
    -- end,
}
