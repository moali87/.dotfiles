local wk = require("which-key")
local fzf = require('fzf-lua')
local mappings = {
    ["<leader>"] = {
        f = {
            name = "+fzfFind",
            f = { function() fzf.files() end, "Find files" },
            p = { function() fzf.grep_project() end, "Find text in project" },
            b = { function() fzf.buffers() end, "Find buffer" },
        }
    }
}
wk.register(mappings)
