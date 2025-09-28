return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        "alexandre-abrioux/blink-cmp-npm.nvim",
        'MahanRahmati/blink-nerdfont.nvim',
        -- 'bydlw98/blink-cmp-env',
        'junkblocker/blink-cmp-wezterm',
        'rafamadriz/friendly-snippets',
        'xieyonn/blink-cmp-dat-word',
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = 'luasnip' },
        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = false,
                },
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            ghost_text = {
                enabled = vim.g.ai_cmp,
            },
        },

        -- experimental signature help support
        -- signature = { enabled = true },

        sources = {
            providers = {
                npm = {
                    name = "npm",
                    module = "blink-cmp-npm",
                    async = true,
                    -- optional - make blink-cmp-npm completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                    -- optional - blink-cmp-npm config
                    ---@module "blink-cmp-npm"
                    ---@type blink-cmp-npm.Options
                    opts = {
                        ignore = {},
                        only_semantic_versions = true,
                        only_latest_version = false,
                    }
                },
                -- env = {
                --     name = "Env",
                --     module = "blink-cmp-env",
                --     --- @type blink-cmp-env.Options
                --     opts = {
                --         item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
                --         show_braces = false,
                --         show_documentation_window = true,
                --     },
                -- },
                datword = {
                    name = "Word",
                    module = "blink-cmp-dat-word",
                    opts = {
                        paths = {
                            -- "path_to_your_words.txt", -- add your owned word files before dictionary.
                            "/usr/share/dict/words", -- This file is included by default on Linux/macOS.
                        },
                    },
                },
                nerdfont = {
                    module = "blink-nerdfont",
                    name = "Nerd Fonts",
                    score_offset = 15, -- Tune by preference
                    opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
                },
                wezterm = {
                    module = "blink-cmp-wezterm",
                    name = "wezterm",
                    -- default options
                    opts = {
                        all_panes = false,
                        capture_history = false,
                        -- only suggest completions from `wezterm` if the `trigger_chars` are
                        -- used
                        triggered_only = false,
                        trigger_chars = { "." }
                    },
                },
            },
            -- adding any nvim-cmp sources here will enable them
            -- with blink.compat
            -- compat = {},
            default = {
                "buffer",
                "datword",
                -- "env",
                "lsp",
                "nerdfont",
                "npm",
                "path",
                "snippets",
                'wezterm',
            },
        },

        cmdline = {
            enabled = true,
            keymap = { preset = "cmdline" },
            completion = {
                list = { selection = { preselect = false } },
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
                ghost_text = { enabled = true },
            },
        },

        keymap = {
            preset = "enter",
            ["<C-y>"] = { "select_and_accept" },
        },
    },
    -- opts = {
    --     snippets = { preset = 'luasnip' },
    --     -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    --     -- 'super-tab' for mappings similar to vscode (tab to accept)
    --     -- 'enter' for enter to accept
    --     -- 'none' for no mappings
    --     --
    --     -- All presets have the following mappings:
    --     -- C-space: Open menu or open docs if already open
    --     -- C-n/C-p or Up/Down: Select next/previous item
    --     -- C-e: Hide menu
    --     -- C-k: Toggle signature help (if signature.enabled = true)
    --     --
    --     -- See :h blink-cmp-config-keymap for defining your own keymap
    --     keymap = { preset = 'default' },
    --
    --     appearance = {
    --         -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --         -- Adjusts spacing to ensure icons are aligned
    --         nerd_font_variant = 'mono'
    --     },
    --
    --     -- (Default) Only show the documentation popup when manually triggered
    --     completion = {
    --         ghost_text = {
    --             enabled = vim.g.ai_cmp,
    --         },
    --         accept = {
    --             -- experimental auto-brackets support
    --             auto_brackets = {
    --                 enabled = true,
    --             },
    --         },
    --         menu = {
    --             draw = {
    --                 treesitter = { "lsp" },
    --             },
    --         },
    --         documentation = {
    --             auto_show = false
    --         },
    --         list = {
    --             selection = {
    --                 preselect = false,
    --                 auto_insert = true
    --             },
    --         },
    --     },
    --
    --     -- Default list of enabled providers defined so that you can extend it
    --     -- elsewhere in your config, without redefining it, due to `opts_extend`
    --     sources = {
    --         default = {
    --             'lsp',
    --             'path',
    --             'snippets',
    --             'buffer',
    --             'wezterm',
    --         },
    --         providers = {
    --             datword = {
    --                 name = "Word",
    --                 module = "blink-cmp-dat-word",
    --                 opts = {
    --                     paths = {
    --                         -- "path_to_your_words.txt", -- add your owned word files before dictionary.
    --                         "/usr/share/dict/words", -- This file is included by default on Linux/macOS.
    --                     },
    --                 },
    --             },
    --             nerdfont = {
    --                 module = "blink-nerdfont",
    --                 name = "Nerd Fonts",
    --                 score_offset = 15, -- Tune by preference
    --                 opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
    --             },
    --             wezterm = {
    --                 module = "blink-cmp-wezterm",
    --                 name = "wezterm",
    --                 -- default options
    --                 opts = {
    --                     all_panes = false,
    --                     capture_history = false,
    --                     -- only suggest completions from `wezterm` if the `trigger_chars` are
    --                     -- used
    --                     triggered_only = false,
    --                     trigger_chars = { "." }
    --                 },
    --             },
    --         }
    --     },
    --     keymap = {
    --         ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    --         ['<C-e>'] = { 'cancel', 'fallback' },
    --         ['<C-y>'] = { 'select_and_accept', 'fallback' },
    --
    --         ['<Up>'] = { 'select_prev', 'fallback' },
    --         ['<Down>'] = { 'select_next', 'fallback' },
    --
    --         ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    --         ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    --
    --         ['<Right>'] = { 'select_next', 'fallback' },
    --         ['<Left>'] = { 'select_prev', 'fallback' },
    --
    --         -- ['<Tab>'] = { 'show_and_insert_or_accept_single', 'select_next', 'snippet_forward', 'fallback_to_mappings', 'fallback' },
    --         -- ['<S-Tab>'] = { 'show_and_insert_or_accept_single', 'select_prev',  'snippet_backward', 'fallback_to_mappings', 'fallback'  },
    --         -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
    --         -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    --
    --         ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    --     },
    --     cmdline = {
    --         completion = {
    --             menu = {
    --                 auto_show = true
    --             },
    --             list = {
    --                 selection = {
    --                     preselect = false,
    --                     auto_insert = true
    --                 },
    --             },
    --         },
    --     },
    --
    --     -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    --     -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    --     -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --     --
    --     -- See the fuzzy documentation for more information
    --     fuzzy = { implementation = "prefer_rust_with_warning" }
    -- },
    opts_extend = { "sources.default" }
}
