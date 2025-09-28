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
    }
}

wk.add(buffer_mappings)
