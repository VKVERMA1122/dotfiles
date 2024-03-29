he only required line is this one.
local wezterm = require 'wezterm'
local act = wezterm.action

--config
return {
  hyperlink_rules = wezterm.default_hyperlink_rules(),
  --color_scheme = "Gruvbox dark, soft (base16)",
  font_size = 11,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  font = wezterm.font('JetBrains Mono', { weight = 'DemiBold' }),
  window_decorations = "NONE",
  inactive_pane_hsb = { saturation = 1, brightness = 1 }, -- s0.9, b0.8
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  window_close_confirmation = 'NeverPrompt',
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    --splits
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '\\',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'w',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },

    --tabs
    {
      key = 's',
      mods = 'LEADER|CTRL',
      action = wezterm.action.ActivateLastTab,
    },
    {
      key = 't',
      mods = 'SHIFT|CTRL',
      action = act.SpawnTab 'CurrentPaneDomain',
    },

    --cmd palette
    {
      key = 'P',
      mods = 'CTRL',
      action = wezterm.action.ActivateCommandPalette,
    },
  }
}
