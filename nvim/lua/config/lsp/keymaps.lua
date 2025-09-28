local wk = require("which-key")
local fzf = require("fzf-lua")
-- local hover = require("hover")
local hover = require("pretty_hover")
local opts = { noremap = true, silent = true, bufnr = bufnr }
-- if client.server_capabilities.inlayHintProvider then
--     vim.lsp.inlay_hint.enable(true)
-- end
local mappings = {
    {
        { "<Leader>l", group = "LSP", remap = false },
        { "<Leader>la", group = "LSP Actions", remap = false },
        { "<Leader>lac", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action", remap = false },
        { "<Leader>laf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", desc = "Code format", remap = false },
        { "<Leader>laq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Set loc list", remap = false },
        { "<Leader>lar", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename", remap = false },
        { "<Leader>lawa", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Add workspace folder", remap = false },
        { "<Leader>lawl", "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", desc = "List workspace folders", remap = false },
        { "<Leader>lawr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove workspace folder", remap = false },
        { "<Leader>lg", group = "LSP Go To", remap = false },
        { "<Leader>lgD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition", remap = false },
        { "<Leader>lgd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition", remap = false },
        { "<Leader>lgi", function () fzf.lsp_implementations() end, desc = "Implementations", remap = false },
        { "<Leader>lgn", function () fzf.lsp_references() end, desc = "References", remap = false },
        { "<Leader>lp", group = "LSP Problem", remap = false },
        -- { "<Leader>lpK", function () hover.hover_select() end, desc = "Hover signature select", remap = false },
        { "<Leader>lpK", function () hover.hover() end, desc = "Hover signature select", remap = false },
        { "<Leader>lpe", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Diagnostic Float", remap = false },
        { "<Leader>lpk", function () hover.hover() end, desc = "Hover signature help", remap = false },
        { "<Leader>lpn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next problem", remap = false },
        { "<Leader>lpp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous problem", remap = false },
    }
}
wk.add(mappings, opts)
