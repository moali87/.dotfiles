return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 1000 ,
    cmd = "Trouble",
    opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
    },
    config = function ()
        require("config.trouble.keymaps")
    end
}
