local config = wezterm.config_builder()

-- Colors
config.color_scheme_dirs = { "colors/" }
config.color_scheme = "gruvbox_material_medium_dark"

-- Fonts
config.font = wezterm.font_with_fallback({
	"Maple Mono NF",
	"Twemoji",
})

-- General Config
config.use_fancy_tab_bar = false -- Personally don't like the modern one.

config.set_environment_variables = {
	WEZTERM_LOG = "window::os=off",
}

config.window_decorations = "RESIZE"

-- I prefer to use CMD on macos when doing things & ctrl on non-macos
local modifier = "CTRL"
if wezterm.target_triple == "aarch64-apple-darwin" then
	modifier = "CMD"
end

config.keys = {
	{
		key = "p",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
	},
}

config.mouse_bindings = {
	-- Regular clicking does not open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	-- CTRL click opens hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = modifier,
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.Nop,
	},
}

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Background = { Color = "3c3836" } },
			{ Foreground = { Color = "d4be98" } },
			{ Attribute = { Intensity = "Bold" } },
			{ Text = " " },
			{ Attribute = { Underline = "Single" } },
			{ Text = title .. " " },
		}
	end
	return {
		{ Background = { Color = "32302f" } },
		{ Text = title },
	}
end)

-- TODO: Change back when wezterm/5990 is resolved
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

return config
