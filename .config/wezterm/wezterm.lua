local wezterm = require('wezterm')
local config = {}

local act = wezterm.action

-- look of status portion of tab bar
require('status')
-- look of tabs themselves
require('tabbar')
-- multiplexing
require('local_mux')


-- core config
config.term = "wezterm"
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.audible_bell = "Disabled"
config.tab_max_width = 20

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.97
config.macos_window_background_blur = 10

-- themeing
config.color_scheme = 'nightfox'
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.6,
}
config.command_palette_rows = 10
config.exit_behavior = "CloseOnCleanExit"
config.show_new_tab_button_in_tab_bar = false
config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#000000',
  }
}
config.window_padding = {
  left = '0cell',
  right = '0cell',
  top = '0cell',
  bottom = '0cell',
}

-- font
config.font_size = 14.0
config.command_palette_font_size = 24.0
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font Mono", scale = 1.05 },
  { family = "GeistMono Nerd Font Mono",     scale = 1.05 },
  "Apple Color Emoji",
})

-- keymaps
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  { key = 'l', mods = 'LEADER', action = wezterm.action.ShowLauncher },
  {
    key = 'y',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      args = { '/Users/jacob/bin/ink_fzf' },
    },
  },
  {
    key = 'f',
    mods = 'SUPER',
    action = act.ToggleFullScreen,
  },
  -- hammerspoon window management
  {
    key = 'm',
    mods = 'CTRL',
    action = act.ToggleFullScreen,
  },
  {
    key = 'p',
    mods = 'CTRL|SUPER',
    action = act.DisableDefaultAssignment,
  },
  {
    key = ']',
    mods = 'CTRL|SUPER',
    action = act.DisableDefaultAssignment,
  },
  {
    key = 'l',
    mods = 'CTRL|SUPER',
    action = act.DisableDefaultAssignment,
  },
  {
    key = "'",
    mods = 'CTRL|SUPER',
    action = act.DisableDefaultAssignment,
  },
  {
    key = ",",
    mods = 'CTRL|SUPER',
    action = act.DisableDefaultAssignment,
  },
  {
    key = "/",
    mods = 'CTRL|SUPER',
    action = act.DisableDefaultAssignment,
  },
  -- splits -- also see smart-splits below
  {
    key = 'd',
    mods = 'SUPER',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      -- command = { args = { 'top' } },
      size = { Percent = 50 },
    },
  },
  {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = 'u',
    mods = 'LEADER',
    action = act.EmitEvent('trigger-urlx-with-scrollback'),
  },
  {
    key = 't',
    mods = 'SUPER',
    -- action = act.SendString('\x00\x63'),
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function (window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'SUPER',
    action = act.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = act.ActivateTab(i - 1),
  })
end

-- event handlers
wezterm.on('trigger-urlx-with-scrollback', function (window, pane)
  -- Retrieve the text from the pane
  local text = pane:get_lines_as_text(pane:get_dimensions().scrollback_rows)

  -- Create a temporary file to pass to vim
  local name = os.tmpname()
  local f = io.open(name, 'w+')
  if not f then
    return
  end
  f:write(text)
  f:flush()
  f:close()

  -- Open a new window running vim and tell it to open the file
  window:perform_action(
    act.SplitPane {
      direction = 'Down',
      command = { args = { '/Users/jacob/bin/urlx', 'choose', '--file-path', name } },
      size = { Percent = 30 },
    },
    pane
  )

  -- Wait "enough" time for urlx to read the file before we remove it.
  wezterm.sleep_ms(100)
  os.remove(name)
end)

-- smart splits
local smart_splits = wezterm.plugin.require(
  'https://github.com/mrjones2014/smart-splits.nvim')
-- you can put the rest of your Wezterm config here
smart_splits.apply_to_config(config, {
  -- the default config is here, if you'd like to use the default keys,
  -- you can omit this configuration table parameter and just use
  -- smart_splits.apply_to_config(config)

  -- directional keys to use in order of: left, down, up, right
  direction_keys = { 'h', 'j', 'k', 'l' },
  -- modifier keys to combine with direction_keys
  modifiers = {
    move = 'CTRL',       -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'CTRL|ALT', -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
})

wezterm.on('user-var-changed', function (window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

return config
