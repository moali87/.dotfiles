local wezterm = require 'wezterm'

local config = {}
-- config.color_scheme = 'GruvboxDark'
-- config.color_scheme_dirs = {'./colorschemes'}
-- config.color_scheme = 'Material (Gogh)'
config.color_scheme = 'Monokai (terminal.sexy)'
config.font = wezterm.font('Fira Code')
config.term = 'wezterm'
config.keys = {
    {
        key = 'r',
        mods = 'CMD|SHIFT',
        action = wezterm.action.ReloadConfiguration
    }
}

return config
