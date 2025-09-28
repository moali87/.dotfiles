return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
         require("nvim-treesitter.configs").setup(require('config.treesitter.config'))
    end
}
