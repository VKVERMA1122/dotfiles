-- The only required line is this one.
local wezterm = require 'wezterm'

return {
  color_scheme = "Gruvbox dark, soft (base16)",
  font_size = 11,
  window_background_opacity = 0.95,
  hide_tab_bar_if_only_one_tab = false,
  font = wezterm.font('JetBrains Mono', { weight = 'DemiBold' }),
  window_decorations = "NONE",
  use_fancy_tab_bar = false,
  inactive_pane_hsb = { saturation = 1, brightness = 1 }, -- s0.9, b0.8
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
}
