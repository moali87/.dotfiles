local wezterm = require 'wezterm'

return {
  color_scheme = "Cobalt2",
  keys = {
    {
      key = 'r',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ReloadConfiguration,
    },
  },
}
