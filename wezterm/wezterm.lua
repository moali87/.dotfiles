local wezterm = require 'wezterm'

return {
  color_scheme = "ayu",
  keys = {
    {
      key = 'r',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ReloadConfiguration,
    },
  },
}
