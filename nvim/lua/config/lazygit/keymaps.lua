local wk = require("which-key")
local mappings = {
    { "<leader>g", group = "Git" },
    { "<leader>gg", "<cmd>LazyGit <cr>", desc = "LazyGit" },
}
wk.add(mappings)
