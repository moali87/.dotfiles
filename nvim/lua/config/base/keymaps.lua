local wk = require("which-key")
local buffer_mappings = {
    {
        { "<leader>b", group = "buffer" },
        { "<leader>bQ", "<cmd>bd! <cr>", desc = "Delete without saving" },
        { "<leader>bS", "<cmd>hori sb<cr>", desc = "Split" },
        { "<leader>bn", "<cmd>bnext <cr>", desc = "Next" },
        { "<leader>bp", "<cmd>bprevious <cr>", desc = "Previous" },
        { "<leader>bq", "<cmd>bd <cr>", desc = "Delete" },
        { "<leader>bs", "<cmd>vert sb<cr>", desc = "Split" },
        { "<leader>p", group = "pane" },
        { "<leader>ph", "<cmd>wincmd h<cr>", desc = "Left" },
        { "<leader>pj", "<cmd>wincmd j<cr>", desc = "Down" },
        { "<leader>pk", "<cmd>wincmd k<cr>", desc = "Up" },
        { "<leader>pl", "<cmd>wincmd l<cr>", desc = "Right" },
    }
}

wk.add(buffer_mappings)
