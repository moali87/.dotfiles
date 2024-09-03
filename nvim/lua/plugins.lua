local plugins = {
    {
        "mistricky/codesnap.nvim",
        run = "make"
    },
    { "MunifTanjim/nui.nvim" },
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        config = function()
            require("render-markdown").setup({})
        end,
    },
    {
        "loctvl842/monokai-pro.nvim",
        priority = 1000 ,
        config = function()
            require("monokai-pro").setup()
        end
    },
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function ()
            require('mini.icons').setup()
        end
    },
    { "nvim-tree/nvim-web-devicons" },
    { "chrisgrieser/cmp-nerdfont" },
    { "projekt0n/caret.nvim" },
    {
        "David-Kunz/gen.nvim",
        opts = {
            model = "codellama", -- The default model to use.
            display_mode = "float", -- The display mode. Can be "float" or "split".
            show_prompt = true, -- Shows the Prompt submitted to Ollama.
            show_model = true, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = false, -- Never closes the window automatically.
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            -- Function to initialize Ollama
            command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a lua function returning a command string, with options as the input parameter.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            list_models = "<function>", -- Retrieves a list of model names
            debug = true, -- Prints errors and the command which is run.
            dev = true
        }
    },
    -- {
    --     "mrcjkb/rustaceanvim",
    --     version = "^4", -- Recommended
    --     lazy = false, -- This plugin is already lazy
    -- },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function ()
            require("config.trouble.keymaps")
        end
    },
    {"voldikss/vim-floaterm"},
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
            require("config.fzf.keymaps")
        end
    },
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "williamboman/mason.nvim",
            "folke/which-key.nvim",
        },
        -- opt = true,
        -- module = { "dap" },
        config = function()
            require("dap-config").setup()
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        -- "nvim-telescope/telescope-dap.nvim",
        -- { "leoluz/nvim-dap-go", module = "dap-go" },
        "leoluz/nvim-dap-go",
        -- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        "jbyuki/one-small-step-for-vimkind",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    },

    {
        "folke/which-key.nvim",
        config = function ()
            require("which-key").setup{}
            require("whichkey")
        end
    },
    {
	    "lewis6991/gitsigns.nvim",
	    tag = "release", -- To use the latest release
	    config = function()
		    require("gitsigns").setup()
	    end
    },
    {
        "windwp/nvim-autopairs",
        dependencies = { { "hrsh7th/nvim-cmp" } },
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        enabled = true,
        config = function()
            require("config.null-ls.config")
        end
    },
    -- {
    --     "akinsho/bufferline.nvim",
    --     version = "v4.5.*",
    --     dependencies = "nvim-tree/nvim-web-devicons",
    --     config = function()
    --         require("bufferline").setup(
    --             require("config.bufferline.config")
    --         )
    --     end
    -- },
    {"nvim-lua/plenary.nvim"},
    {"famiu/bufdelete.nvim"},
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup()
        end
    },
    {
        "Fildo7525/pretty_hover",
        config = function()
            require("pretty_hover").setup()
        end
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end
    },

    {
        "kdheepak/lazygit.nvim",
        config = function()
            require("config.lazygit.keymaps")
        end
    },
    {
        "neovim/nvim-lspconfig",
        priority = 900,
        config = function ()
            require("config.lspconfig.config")
        end
    },
    {
	"lewis6991/hover.nvim",
        lazy = false,
        config = function()
            require("config.hover.config")
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("config.mason.config")
        end
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "saadparwaiz1/cmp_luasnip",
	    "hrsh7th/cmp-buffer",
	    {"tzachar/cmp-tabnine", run = "./install.sh"},
	    "hrsh7th/cmp-cmdline",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-nvim-lsp-signature-help",
	    "hrsh7th/cmp-nvim-lua",
	    "hrsh7th/cmp-path",
	},
        config = function()
            require("config.cmp.config")
        end
    },
    { "folke/lsp-colors.nvim" },
    {
        "tzachar/cmp-tabnine",
        build = "./install.sh"
    },
    {
        "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup(require("config.treesitter.config"))
        end
    },
    { "nvim-treesitter/playground",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("config.treesitter.playground-config")
        end
    }
}

return require("lazy").setup(plugins)
