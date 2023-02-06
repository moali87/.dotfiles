local wezterm = require 'wezterm'

return {
  color_scheme = "AyuMirage (Gogh)",
  keys = {
    {
      key = 'r',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ReloadConfiguration,
    },
  },
}
