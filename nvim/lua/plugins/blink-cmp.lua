return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"alexandre-abrioux/blink-cmp-npm.nvim",
		"MahanRahmati/blink-nerdfont.nvim",
		-- 'bydlw98/blink-cmp-env',
		"junkblocker/blink-cmp-wezterm",
		"rafamadriz/friendly-snippets",
		"xieyonn/blink-cmp-dat-word",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		snippets = { preset = "luasnip" },
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
					},
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
						trigger_chars = { "." },
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
				"wezterm",
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
	opts_extend = { "sources.default" },
}
