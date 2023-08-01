local wk = require("which-key")
local mappings = {
        ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<cr>", "Move left" },
        ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<cr>", "Move down" },
        ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<cr>", "Move up" },
        ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<cr>", "Move right" },
        ["<C-\\>"] = { "<cmd>NvimTmuxNavigateLastActive<cr>", "Move last" },
        ["<C-n>"] = { "<cmd>NvimTmuxNavigateNext<cr>", "Move next" },
}

wk.register(mappings)
