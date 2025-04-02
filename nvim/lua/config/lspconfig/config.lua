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

lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
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
