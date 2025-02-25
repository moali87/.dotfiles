require('config.lspconfig.keymaps')
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local runtime_path = vim.split(package.path, ";")

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = {
    "clangd",
    "solargraph",
    "pyright",
    "ts_ls",
    "terraformls",
    "tflint",
    "yamlls",
    "jdtls",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end



local configs = require("lspconfig/configs")
if not configs.regols then
    configs.regols = {
        default_config = {
            cmd = { 'regols' },
            filetypes = { 'rego' },
            root_dir = lspconfig.util.root_pattern(".git"),
        }
    }
end
configs.regols.setup {}
lspconfig.gopls.setup {
    filetypes = { "go", "gomod" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                fillstruct = true,
            },
        },
    },
}

lspconfig.ts_ls.setup {
    -- filetypes = { "astro" },
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy";
            },
            diagnostics = {
                enable = true;
            }
        }
    }
}

lspconfig.astro.setup {
    filetypes = { "astro" },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- lspconfig.terraformls.setup {
--     filetypes = {"terraform", "tf"},
--     on_attach = on_attach,
--     capabilities = capabilities,
--     command = "terraform-ls",
--     args = {"serve"}
-- }
