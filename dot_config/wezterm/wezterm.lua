-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- Window
config.front_end = "WebGpu"
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Font
config.font = wezterm.font("JetBrains Mono", { weight = "DemiBold" })
config.font_size = 17

-- Keymaps
config.disable_default_key_bindings = true
config.keys = {
	{
		key = "v",
		mods = "SUPER",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "Comma",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "," }),
		}),
	},
	{
		key = "1",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "1" }),
		}),
	},
	{
		key = "2",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "2" }),
		}),
	},
	{
		key = "3",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "3" }),
		}),
	},
	{
		key = "4",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "4" }),
		}),
	},
	{
		key = "5",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "5" }),
		}),
	},
	{
		key = "6",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "6" }),
		}),
	},
	{
		key = "7",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "7" }),
		}),
	},
	{
		key = "8",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "8" }),
		}),
	},
	{
		key = "9",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "9" }),
		}),
	},
	{
		key = "N",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = '"' }),
		}),
	},
	{
		key = "n",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "%" }),
		}),
	},
	{
		key = "Q",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "d" }),
		}),
	},
	{
		key = "{",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "p", mods = "CTRL" }),
		}),
	},
	{
		key = "}",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "n", mods = "CTRL" }),
		}),
	},
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "c" }),
		}),
	},
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "x" }),
		}),
	},
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "f", mods = "CTRL" }),
		}),
	},
	{
		key = "<",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "<" }),
		}),
	},
	{
		key = ">",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = ">" }),
		}),
	},
	{
		key = "h",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "h" }),
		}),
	},
	{
		key = "j",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "j" }),
		}),
	},
	{
		key = "k",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "k" }),
		}),
	},
	{
		key = "l",
		mods = "SUPER|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "l" }),
		}),
	},
}

-- and finally, return the configuration to wezterm
return config