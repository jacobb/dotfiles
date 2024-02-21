local function apply_screen_math(val, max)
  if val == 0 and val > 1 then
    return val
  end
  return val * max
end

local function move_current_window(x, y, w, h, duration)
  local win = hs.window.focusedWindow()
  local screen_rect = win:screen():frame()

  local win_x = apply_screen_math(x, screen_rect.w)
  local win_y = apply_screen_math(y, screen_rect.h)
  local win_w = apply_screen_math(w, screen_rect.w)
  local win_h = apply_screen_math(h, screen_rect.h)
  local frame = hs.geometry.new(win_x, win_y + screen_rect.y, win_w, win_h)

  win:setFrame(frame, duration)
end

hs.hotkey.bind({ "cmd", "ctrl" }, "P", function()
  move_current_window(0, 0, 0.5, 0.5, 0)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "]", function()
  move_current_window(0.5, 0, 0.5, 0.5, 0)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "'", function()
  move_current_window(0.5, 0, 0.5, 1, 0)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "l", function()
  move_current_window(0, 0, 0.5, 1, 0)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, ",", function()
  move_current_window(0, 0.5, 0.5, 0.5, 0)
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "/", function()
  move_current_window(0.5, 0.5, 0.5, 0.5, 0)
end)

hs.hotkey.bind({ "ctrl" }, "m", function()
  move_current_window(0, 0, 1, 1, 0)
end)
