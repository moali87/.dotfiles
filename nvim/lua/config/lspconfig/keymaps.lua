local wk = require("which-key")
local fzf = require("fzf-lua")
local hover = require("hover")
function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, bufnr = bufnr }
    local mappings = {
        ["<Leader>"] = {
            l = {
                name = "+LSP",
                p = {
                    name = "LSP Problem",
                    e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic Float" },
                    k = { function () hover.hover() end, "Hover signature help" },
                    K = { function () hover.hover_select() end, "Hover signature select" },
                    n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next problem" },
                    p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous problem" },
                },
                g = {
                    name = "LSP Go To",
                    n = { function () fzf.lsp_references() end, "References" },
                    i = { function () fzf.lsp_implementations() end, "Implementations"},
                    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
                    -- D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
                    D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
                },
                a = {
                    name = "LSP Actions",
                    c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
                    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Code format" },
                    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
                    wa = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Add workspace folder" },
                    wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder" },
                    wl = { "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", "List workspace folders" },
                    q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loc list" },
                }
            }
        }
    }
    wk.register(mappings, opts)
end
