local wk = require("which-key")
local mappings = {
    ["<leader>"] = {
        g = {
            name = "Git",
            g = { "<cmd>LazyGit <cr>", "LazyGit" },
        }
    }
}

wk.register(mappings)
