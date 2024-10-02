local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
-- Show which key table is active in the status area
wezterm.on('update-right-status', function (window, pane)
    local name = window:active_key_table()
    if name then
        name = 'TABLE: ' .. name
    end
    window:set_right_status(name or '')
end)
-- config.color_scheme = 'GruvboxDark'
-- config.color_scheme_dirs = {'./colorschemes'}
-- config.color_scheme = 'Material (Gogh)'
config.color_scheme = 'Monokai (terminal.sexy)'
config.font = wezterm.font('Fira Code')
config.term = 'xterm-256color'
config.keys = {
    {
        key = 'r',
        mods = 'CMD|SHIFT',
        action = act.ReloadConfiguration
    },
    {
        key = 'y', mods = 'CTRL', action = act.ShowDebugOverlay
    },
    {
        key = 'p',
        mods = 'CMD',
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            timeout_milliseconds = 1000,
        },
    },
    {
        key = 'p',
        mods = 'ALT',
        action = act.ActivateKeyTable {
            name = 'activate_pane',
            timeout_milliseconds = 1000,
        },
    },
    {
        key = 'p',
        mods = 'CTRL',
        action = act.ActivateKeyTable {
            name = 'create_pane',
            timeout_milliseconds = 1000,
        },
    },
}

config.key_tables = {
    -- Defines the keys that are active in our resizing-pane mode.
    -- Since we're likely to want to make multiple adjustments,
    -- we made the activation one_shot=false.  We therefore need
    -- to define a key assignment for getting out of this mode.
    -- 'resize_pane' here corresponds to the name="resize_pane" in
    -- the key assignments above.
    resize_pane = {
        { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
        { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

        { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
        { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

        { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
        { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

        { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
        { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

        -- Cancel the mode by pressing escape
        { key = 'Escape', action = 'PopKeyTable' },
    },

    -- Defines the keys that are active in our activate-pane mode.
    -- 'activate_pane' here corresponds to the name name="activate_pane" in
    -- the key assignments above.
    activate_pane = {
        { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
        { key = 'h', action =  act.ActivatePaneDirection 'Left' },
        { key = 'f', action =  act.TogglePaneZoomState },

        { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
        { key = 'l', action =  act.ActivatePaneDirection 'Right' },

        { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
        { key = 'k', action =  act.ActivatePaneDirection 'Up' },

        { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
        { key = 'j', action =  act.ActivatePaneDirection 'Down' },

        -- Cancel the mode by pressing escape
        { key = 'Escape', action = 'PopKeyTable' },
    },

    create_pane = {
        {
            key = 'LeftArrow',
            action = act.SplitPane {
                direction = 'Left',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'h',
            action = act.SplitPane {
                direction = 'Left',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'RightArrow',
            action = act.SplitPane {
                direction = 'Right',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'l',
            action = act.SplitPane {
                direction = 'Right',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'UpArrow',
            action = act.SplitPane {
                direction = 'Up',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'k',
            action = act.SplitPane {
                direction = 'Up',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'DownArrow',
            action = act.SplitPane {
                direction = 'Down',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'j',
            action = act.SplitPane {
                direction = 'Down',
                size = {
                    Percent = 50
                }
            }
        },
        {
            key = 'd',
            action = act.CloseCurrentPane {
                confirm = true
            }
        },
    },
}
return config
