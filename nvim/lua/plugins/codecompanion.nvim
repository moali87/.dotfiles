return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    endpoint = "http://localhost:11434/api", -- Default Ollama API endpoint
                    model = "qwen3-coder", -- Or whatever model you are running locally
                })
            end,
        },
        strategies = {
            chat = { adapter = "ollama" },
            inline = { adapter = "ollama" },
            agent = { adapter = "ollama" },
        },
    }
}
