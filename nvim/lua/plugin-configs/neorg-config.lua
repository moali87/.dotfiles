return {
  load = {
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
            }
        },
		["core.defaults"] = {},
        --[[ ["core.gtd.base"] = {
            config = {
                workspace = 
            }
        }, ]]
        ["core.integrations.telescope"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.treesitter"] = {
            config = {
                config_parsers = true
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                }
            }
        },
		["core.norg.concealer"] = {},
		["core.norg.qol.toc"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp"
			}
		}
	}
}
