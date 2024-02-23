require('win')
-- require('keycastr')

hs.hotkey.bind({ "cmd", "ctrl" }, "1", function()
  hs.application.find("WezTerm"):activate()
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "2", function()
  hs.application.find("Firefox Developer Edition"):activate()
end)
