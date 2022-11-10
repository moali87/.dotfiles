local packer = require("packer")
local use = packer.use
return packer.startup(function()
    -- Non lazy loaded plugins
    use({ "wbthomason/packer.nvim" })
    use({ "neovim/nvim-lspconfig" })
    use({ "lewis6991/impatient.nvim", config = function() require("impatient").enable_profile() end })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup(require("plugin-configs.treesitter"))
        end
    })
    use({ "nvim-treesitter/playground",
        requires = { "nvim-treesitter/nvim-treesitter" },
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
    })
    use({ "ellisonleao/gruvbox.nvim" })
    use({ "folke/lsp-colors.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "kdheepak/lazygit.nvim" })

    -- whichkey
    use({
        "folke/which-key.nvim",
        config = function ()
            require("which-key").setup{}
            require("whichkey")
        end
    })

    use({
        "mfussenegger/nvim-dap",
        requires = {
            "williamboman/mason.nvim",
            "folke/which-key.nvim",
        },
        -- opt = true,
        module = { "dap" },
        config = function()
            require("dap-config").setup()
        end
    })

    use({
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "nvim-telescope/telescope-dap.nvim",
        { "leoluz/nvim-dap-go", module = "dap-go" },
        { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        requires = {
            "mfussenegger/nvim-dap",
        }
    })

    -- cmp and cmp attachments
    use({
        "hrsh7th/nvim-cmp",
        after = "nvim-lspconfig",
        -- event = {"InsertEnter *", "CmdlineEnter"}, -- Can"t do this cause it"s slow
        requires = {
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("plugin-configs.luasnip")
                end,
                requires = {
                    "saadparwaiz1/cmp_luasnip",
                    "hrsh7th/cmp-buffer",
                    {"tzachar/cmp-tabnine", run = "./install.sh"},
                    "hrsh7th/cmp-cmdline",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-nvim-lsp-signature-help",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/cmp-path",
                },
            },
        },
        config = function()
            require("plugin-configs.cmp")
        end
    })

    -- lualine
    use({
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            require("lualine").setup({
                options = { theme = "powerline" }
            })
        end
    })

    -- leap
    use({
        "ggandor/leap.nvim",
        event = { "BufEnter", "BufWinEnter" },
        config = function()
            require("leap").add_default_mappings()
        end
    })

    use({
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        -- or                            , branch = '0.1.x',
        requires = {
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
    })

    -- lspinstaller
    use({
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
    })

    -- Lazyloaded plugins
    -- null-ls
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugin-configs.null-ls")
        end
    })

    -- bufdelete
    use({
        "famiu/bufdelete.nvim",
        event = "BufWinEnter"
    })


    -- neorg
    use({
        "nvim-neorg/neorg",
        ft = "norg",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-neorg/neorg-telescope",
            "max397574/neorg-kanban",
            "esquires/neorg-gtd-project-tags",
            "max397574/neorg-contexts",
            "danymat/neorg-gtd-things"
        },
        config = function()
            require("neorg").setup(require("plugin-configs.neorg-config"))
        end
    })

    -- bufferline
    use({
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
        tag = "v2.*",
        config = function()
            require("bufferline").setup(
                require("plugin-configs.bufferline-config")
            )
        end
    })

    -- comment
    use({
        "numToStr/Comment.nvim",
        event = "BufWinEnter",
        config = function()
            require("Comment").setup()
        end
    })

    -- blankline
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufWinEnter",
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = true,
                show_end_of_line = true,
            }
        end
    })

    -- gitsigns
    use({
        "lewis6991/gitsigns.nvim",
        event = "BufWinEnter",
        tag = "release", -- To use the latest release
        config = function()
            require("gitsigns").setup()
        end
    })

    -- autopairs
    use({
        "windwp/nvim-autopairs",
        event = "BufWinEnter",
        requires = { { "hrsh7th/nvim-cmp" } },
        config = function()
            require("nvim-autopairs").setup()
        end
    })
end)
