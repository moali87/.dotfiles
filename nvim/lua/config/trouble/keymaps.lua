local wk = require("which-key")
local mappings = {
    ["<leader>"] = {
        x = {
            name = "+trouble",
            d = { function() require("trouble").open("document_diagnostics") end, "Document diagnostics" },
            l = { function() require("trouble").open("loclist") end, "Loclist" },
            q = { function() require("trouble").open("quickfix") end, "Quick Fix" },
            r = { function() require("trouble").open("lsp_references") end, "LSP References"},
            w = { function() require("trouble").open("workspace_diagnostics") end, "Workspace diagnostics"},
            x = { function() require("trouble").open() end, "Open Trouble" },
        }
    }
}

wk.register(mappings)
