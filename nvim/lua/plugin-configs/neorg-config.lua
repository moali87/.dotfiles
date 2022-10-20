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
        ["external.kanban"] = {},
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
		["core.integrations.nvim-cmp"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp"
			}
		}
	}
}
