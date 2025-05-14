local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- hyperlink_rules = wezterm.default_hyperlink_rules(),
	animation_fps = 1,
	prefer_egl = true,
	-- window_background_gradient = {
	-- 	orientation = "Vertical",
	-- 	colors = {
	-- 		"#1a1b26", -- Darker shade (top)
	-- 		"#1f2335", -- Lighter shade (bottom)
	-- 	},
	-- },
	-- window_background_image = 'C:\\Users\\LENOVO\\.config\\wezterm\\wallhaven-85yl61_1920x1080.png',
	-- Set the overall window opacity to reduce the prominence of the background image
	-- Adjust the brightness, saturation, and hue of the background image
	-- window_background_image_hsb = {
	-- 	brightness = 0.1, -- Adjust the brightness (0.0 is fully dark, 1.0 is fully bright)
	-- 	saturation = 0.1, -- Adjust the saturation (0.0 is fully desaturated, 1.0 is fully saturated)
	-- 	hue = 0.0,  -- Adjust the hue (0.0 to 1.0)
	-- },
	default_prog = { "C:\\Program Files\\WindowsApps\\Microsoft.PowerShell_7.5.0.0_x64__8wekyb3d8bbwe\\pwsh.exe" },
	color_scheme = "tokyonight_night",
	font_size = 10,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	font = wezterm.font("FiraCode NFM", { weight = "Medium" }),
	window_background_opacity = 0.94,
	window_decorations = "RESIZE",
	inactive_pane_hsb = { saturation = 1, brightness = 1 },
	window_padding = { left = 0, right = 0, top = 0, bottom = "0.0cell" },
	window_close_confirmation = "NeverPrompt",
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		--splits
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "x",
			mods = "CTRL",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
		},

		--tabs
		{
			key = "s",
			mods = "LEADER|CTRL",
			action = wezterm.action.ActivateLastTab,
		},
		{
			key = "t",
			mods = "SHIFT|CTRL",
			action = act.SpawnTab("CurrentPaneDomain"),
		},

		--cmd palette
		{
			key = "P",
			mods = "CTRL",
			action = wezterm.action.ActivateCommandPalette,
		},

		--copy
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
	hyperlink_rules = {
		-- Matches: a URL in parens: (URL)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in brackets: [URL]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in curly braces: {URL}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in angle brackets: <URL>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		-- Then handle URLs not wrapped in brackets
		{
			-- Before
			--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
			--format = '$0',
			-- After
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",
			highlight = 1,
		},
	},
}
