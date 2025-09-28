return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        -- calling `setup` is optional for customization
        require("config.fzf.keymaps")
    end
}
