local wk = require("which-key")
local mappings = {
        ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<cr>", "Find File" },
        ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<cr>", "Find File" },
        ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<cr>", "Find File" },
        ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<cr>", "Find File" },
        ["<C-\\>"] = { "<cmd>NvimTmuxNavigateLastActive<cr>", "Find File" },
        ["<C-n>"] = { "<cmd>NvimTmuxNavigateNext<cr>", "Find File" },
}

wk.register(mappings)
