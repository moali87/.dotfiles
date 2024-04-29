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
            S = { "<cmd>hori sb<cr>", "Split" },
        },
        p = {
            name = "+pane",
            h = { "<cmd>wincmd h<cr>", "Left" },
            j = { "<cmd>wincmd j<cr>", "Down" },
            k = { "<cmd>wincmd k<cr>", "Up" },
            l = { "<cmd>wincmd l<cr>", "Right" },
        }
    }
}

wk.register(buffer_mappings)
