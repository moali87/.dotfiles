local wk = require("which-key")
local buffer_mappings = {
    ["<leader>"] = {
        b = {
            name = "+buffer",
            n = { "<cmd>bnext <cr>", "Next" },
            p = { "<cmd>bprevious <cr>", "Previous" },
            q = { "<cmd>bd <cr>", "Delete" },
            Q = { "<cmd>bd! <cr>", "Delete without saving" },
            s = { "<cmd>vert sb<cr>", "Split" },
        }
    }
}

wk.register(buffer_mappings)
