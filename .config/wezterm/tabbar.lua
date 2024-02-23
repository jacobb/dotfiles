local wezterm = require('wezterm')

local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  local pane_title = tab_info.active_pane.title
  local cleaned_title = pane_title:match("^(.-) %(")
  return cleaned_title or pane_title
end

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on(
  'format-tab-title',
  function (tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#2a425b'
    local foreground = '#aeafb0'
    local attribute = { Attribute = { Intensity = "Normal" } }

    if tab.is_active then
      background = '#649ddb'
      foreground = '#192330'
      attribute = { Attribute = { Italic = true } }
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = " " .. tab.tab_index + 1 .. " " .. tab_title(tab) .. " "

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_foreground } },
      { Foreground = { Color = edge_background } },
      { Text = SOLID_RIGHT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      attribute,
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
