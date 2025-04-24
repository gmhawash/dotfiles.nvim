local wezterm = require 'wezterm'
local act = wezterm.action

-- Load local config with fallbacks
local function load_local_config()
  local default_config = {
    font_size = 12.8,
  }

  local ok, config = pcall(function()
    local config_path = wezterm.home_dir .. "/.wezterm-local.lua"
    return dofile(config_path)
  end)

  if ok then
    -- Merge with defaults (in case local config is missing some values)
    for key, value in pairs(default_config) do
      if config[key] == nil then
        config[key] = value
      end
    end
    return config
  else
    return default_config
  end
end

local local_config = load_local_config()

-- Color scheme configuration
local colors = {
  scheme = 'Dracula',
  background = '#282a36',
  cursor_bg = '#50fa7b',
  cursor_fg = '#282a36',
  tab_bar = {
    active_tab = {
      bg_color = '#282a36',
      fg_color = "#f5c2e7",
    },
    inactive_tab = {
      bg_color = '#313244',
      fg_color = '#cdd6f4',
    },
  },
}

-- Key bindings
local keys = {
  -- Pane navigation
  { key = 'h',          mods = 'OPT',       action = act.ActivatePaneDirection 'Left' },
  { key = 'l',          mods = 'OPT',       action = act.ActivatePaneDirection 'Right' },
  { key = 'j',          mods = 'OPT',       action = act.ActivatePaneDirection 'Down' },
  { key = 'k',          mods = 'OPT',       action = act.ActivatePaneDirection 'Up' },

  -- Tab management
  { key = "LeftArrow",  mods = "CMD|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "RightArrow", mods = "CMD|SHIFT", action = act.MoveTabRelative(1) },

  -- Utility functions
  { key = 'r',          mods = 'CMD|SHIFT', action = act.ReloadConfiguration },
  { key = 'f',          mods = 'CMD|SHIFT', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },

  -- Workspace management
  {
    key = 'n',
    mods = 'CMD|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(
        act.PromptInputLine {
          description = 'New workspace name:',
          action = wezterm.action_callback(function(window, pane, line)
            if line then
              window:perform_action(
                act.SwitchToWorkspace { name = line },
                pane
              )
            end
          end),
        },
        pane
      )
    end),
  },
}

-- Main configuration
return {
  -- Sound
  audible_bell = 'Disabled',

  -- Appearance
  window_decorations = "RESIZE",
  color_scheme = colors.scheme,
  colors = colors,
  font = wezterm.font("SFMono Nerd Font", {
    weight = "DemiBold",
    stretch = "Normal",
    style = "Normal"
  }),
  font_size = local_config.font_size,

  -- Window settings
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },

  -- UI elements
  enable_tab_bar = true,
  default_cursor_style = "SteadyBar",

  -- Keyboard
  leader = { key = 'a', mods = 'OPT', timeout_milliseconds = 1000 },
  keys = keys,
}
