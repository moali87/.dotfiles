return {
    {"theHamsta/nvim-dap-virtual-text"},
    {"nvim-neotest/nvim-nio"},
    {"rcarriga/nvim-dap-ui"},
    {"mfussenegger/nvim-dap-python",
    config = function()
    -- This is the correct way to specify the `deps_mode`.
    -- Accepted values include 'venv', 'uv', or 'off'.
    require("dap-python").setup("venv", { -- or 'venv'
        -- other optional configurations
    })end},
    -- "nvim-telescope/telescope-dap.nvim",
    -- { "leoluz/nvim-dap-go", module = "dap-go" },
    {"leoluz/nvim-dap-go"},
    -- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    {"jbyuki/one-small-step-for-vimkind"},
    dependencies = {
        "mfussenegger/nvim-dap",
    }
}

