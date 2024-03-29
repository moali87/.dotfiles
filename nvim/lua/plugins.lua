local plugins = {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    { "projekt0n/caret.nvim" },
    {
        "olexsmir/gopher.nvim",
        config = function()
            require("gopher").setup({})
        end
    },
    {
        "crusj/structrue-go.nvim",
        config = function()
            require("structrue-go").setup()
        end
    },
    {
        "crispgm/nvim-go",
        config = function()
            require("go").setup({})
        end
    },
    -- Custom Parameters (with defaults)
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
            list_models = '<function>', -- Retrieves a list of model names
            debug = true, -- Prints errors and the command which is run.
            dev = true
        }
    },
    {
        "simrat39/rust-tools.nvim" ,
        config = function ()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    -- on_attach = function(_, bufnr)
                    --     -- Hover actions
                    --     vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    --     -- Code action groups
                    --     vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    -- end,
                },
            })
        end
    },
    {
        "alexghergh/nvim-tmux-navigation" ,
        config = function ()
            require'nvim-tmux-navigation'.setup {
                disable_when_zoomed = true, -- defaults to false
                keybindings = {
                    left = "<C-h>",
                    down = "<C-j>",
                    up = "<C-k>",
                    right = "<C-l>",
                    last_active = "<C-\\>",
                    next = "<C-Space>",
                }
            }
        end
    },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {"voldikss/vim-floaterm"},
    -- {
    --     "pwntester/octo.nvim",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function ()
    --         require"octo".setup()
    --     end
    -- },
    -- {
    --     "nvim-neorg/neorg",
    --     build = ":Neorg sync-parsers",
    --     dependencies = {
    --         "hrsh7th/nvim-cmp",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-neorg/neorg-telescope",
    --         "max397574/neorg-kanban",
    --         "max397574/neorg-contexts",
    --     },
    --     config = function()
    --         require("neorg").setup(require("plugin-configs.neorg-config"))
    --     end
    -- },
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.5",
        -- or                            , branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-fzy-native.nvim"
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-h>"] = "which_key"
                        }
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true
                    },
                    live_grep = {
                        additional_args = function(opts)
                            return { "--hidden" }
                        end
                    }
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    }
                }
            }
            require("telescope").load_extension("fzy_native")
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
        "nvim-telescope/telescope-dap.nvim",
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
        -- config = function()
        --     require("ibl").setup {
        --         show_current_context = true,
        --         show_current_context_start = true,
        --         show_end_of_line = true,
        --     }
        -- end
    },
    -- {
    --     "mfussenegger/nvim-lint",
    --     dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    --     config = function ()
    --         require("plugin-configs.nvim-lint")
    --     end
    -- },
    -- {
    --     "rshkarin/mason-nvim-lint",
    --     dependencies = { "mfussenegger/nvim-lint" },
    --     config = function ()
    --         require("plugin-configs.mason-nvim-lint")
    --     end
    -- },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        enabled = true,
        config = function()
            require("plugin-configs.null-ls")
        end
    },
    {
        "akinsho/bufferline.nvim",
        version = "v4.1.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup(
                require("plugin-configs.bufferline-config")
            )
        end
    },
    {"nvim-lua/plenary.nvim"},
    {"famiu/bufdelete.nvim"},
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugin-configs.lualine")
            -- require("lualine").setup({
            --     options = { theme = "powerline" }
            -- })
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

    { "kdheepak/lazygit.nvim" },
    { "EdenEast/nightfox.nvim" },
    {"sainnhe/sonokai"},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "uloco/bluloco.nvim",
        dependencies = { "rktjmp/lush.nvim" }
    },
    {"neovim/nvim-lspconfig"},
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
                ui = {
                    icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
	"lewis6991/hover.nvim",
        lazy = false,
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.gh_user')
                    -- require('hover.providers.jira')
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = nil
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true
            }

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
            vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
                ui = {
                    icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "L3MON4D3/LuaSnip",
        version = "1.*"
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
            require("plugin-configs.cmp")
        end
    },
    {"folke/lsp-colors.nvim"},
    {
        "tzachar/cmp-tabnine",
        build = "./install.sh"
    },
    {
        "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup(require("plugin-configs.treesitter"))
        end
    },
    { "nvim-treesitter/playground",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter.configs").setup({
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = false, -- Whether the query persists across vim sessions
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                    },
                }
            })
        end
    }
}

return require("lazy").setup(plugins)
