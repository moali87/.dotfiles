local wk = require("which-key")
local fzf = require('fzf-lua')
local mappings = {
    {"<leader>f", group = "fzfFind" },
    { "<leader>fb", function () fzf.buffers() end, desc = "Find buffer" },
    { "<leader>ff", function() fzf.files() end, desc = "Find files" },
    { "<leader>fp", function() fzf.grep_project() end, desc = "Find text in project" },

}
wk.add(mappings)
