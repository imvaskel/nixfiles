---@type Wezterm
local wezterm = require 'wezterm'
---@type Config
_G.config = wezterm.config_builder()

-- Colors
config.color_scheme_dirs = {'colors/'}
config.color_scheme = 'gruvbox_material_medium_dark'

-- Fonts
config.font = wezterm.font_with_fallback({
    'Maple Mono NF',
    'Twemoji',
})

-- General Config

config.set_environment_variables = {
    WEZTERM_LOG = 'window::os=off',
}

config.window_decorations = 'RESIZE'

-- I prefer to use CMD on macos when doing things & ctrl on non-macos
local modifier = 'CTRL'
if wezterm.target_triple == 'aarch64-apple-darwin' then
    modifier = 'CMD'
end

config.keys = {
    {
        key = 'p',
        mods = modifier .. '|SHIFT',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = 'r',
        mods = modifier .. '|SHIFT',
        action = wezterm.action.ActivateKeyTable {
            name = 'resize_window',
            one_shot = false,
        },
    },
}

config.mouse_bindings = {
    -- Regular clicking does not open hyperlinks
    {
        event = {Up = {streak = 1, button = 'Left'}},
        mods = 'NONE',
        action = wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'),
    },

    -- CTRL click opens hyperlinks
    {
        event = {Up = {streak = 1, button = 'Left'}},
        mods = modifier,
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        event = {Down = {streak = 1, button = 'Left'}},
        mods = 'CTRL',
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

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
        return {
            {Background = {Color = '3c3836'}},
            {Foreground = {Color = 'd4be98'}},
            {Attribute = {Intensity = 'Bold'}},
            {Text = ' '},
            {Attribute = {Underline = 'Single'}},
            {Text = title .. ' '},
        }
    end
    return {
        {Background = {Color = '32302f'}},
        {Text = title},
    }
end)

-- Resize pane
local function resize_window(win, pane, x, y)
    local dimensions = win:get_dimensions()
    local tab_dim = win:active_tab():get_size()
    local y_ratio = tab_dim.pixel_height / tab_dim.rows
    local x_ratio = tab_dim.pixel_width / tab_dim.cols

    local x_add = x_ratio * x
    local y_add = y_ratio * y

    local new_x = dimensions.pixel_width + x_add
    local new_y = dimensions.pixel_height + y_add

    win:set_inner_size(new_x, new_y)
end

wezterm.on('update-status', function(window)
    local name = window:active_key_table()
    local text = ''
    if name then
        text = 'RESIZE  '
    end
    window:set_right_status(text)
end)

config.key_tables = {
    resize_window = {
        {
            key = 'l',
            action = wezterm.action_callback(function(win, pane)
                resize_window(win, pane, 1, 0)
            end),
        },
        {
            key = 'h',
            action = wezterm.action_callback(function(win, pane)
                resize_window(win, pane, -1, 0)
            end),
        },
        {
            key = 'j',
            action = wezterm.action_callback(function(win, pane)
                resize_window(win, pane, 0, 1)
            end),
        },
        {
            key = 'k',
            action = wezterm.action_callback(function(win, pane)
                resize_window(win, pane, 0, -1)
            end),
        },
        -- Cancel by esc or Q
        {key = 'q', action = 'PopKeyTable'},
        {key = 'Escape', action = 'PopKeyTable'},
    },
}

-- Visual bell
config.visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 100,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 100,
}

-- TODO: Change back when wezterm/5990 is resolved
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'

-- Local config sourcing
local wezterm_conf_file = 'wezterm.lua'

-- Check if config path is set (it won't be if you load a file)
local local_conf_path = wezterm.config_dir
if local_conf_path == '' then
    -- Grab all lua files out of the config path
    for _, v in ipairs(wezterm.glob(local_conf_path .. '/*.lua')) do
        -- Make sure we don't circle import the default config
        if string.sub(v, - #wezterm_conf_file) ~= wezterm_conf_file then
            -- Strip off the ~/whatever and .lua extension and import the file
            require(string.sub(v, #local_conf_path + 2, #v - 4))
        end
    end
end


return config
