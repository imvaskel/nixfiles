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

-- TODO: Change back when wezterm/5990 is resolved
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

return config
