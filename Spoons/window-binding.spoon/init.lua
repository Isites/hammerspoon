local wm = require('window-management')
local hk = require "hs.hotkey"
local hints = require "hs.hints"

local hyperWindow = {"ctrl", "alt", "cmd"}

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind({"ctrl", "alt"}, {
  left = wm.throwLeft,
  right = wm.throwRight
})

-- * Set Window Position on screen
windowBind(hyperWindow, {
  m = wm.maximizeWindow,    -- ⌃⌥⌘ + M
  c = wm.halfCenterOnScreen,    -- ⌃⌥⌘ + C
  left = wm.leftHalf,       -- ⌃⌥⌘ + ←
  right = wm.rightHalf,     -- ⌃⌥⌘ + →
  up = wm.topHalf,          -- ⌃⌥⌘ + ↑
  down = wm.bottomHalf      -- ⌃⌥⌘ + ↓
})
-- * Set Window Position on screen
-- windowBind({"ctrl", "alt", "shift"}, {
--   left = wm.rightToLeft,      -- ⌃⌥⇧ + ←
--   right = wm.rightToRight,    -- ⌃⌥⇧ + →
--   up = wm.bottomUp,           -- ⌃⌥⇧ + ↑
--   down = wm.bottomDown        -- ⌃⌥⇧ + ↓
-- })
-- * Set Window Position on screen
-- windowBind({"alt", "cmd", "shift"}, {
--   left = wm.leftToLeft,      -- ⌥⌘⇧ + ←
--   right = wm.leftToRight,    -- ⌥⌘⇧ + →
--   up = wm.topUp,             -- ⌥⌘⇧ + ↑
--   down = wm.topDown          -- ⌥⌘⇧ + ↓
-- })

-- * Windows-like cycle
windowBind(hyperWindow, {
  u = wm.cycleLeft,          -- ⌃⌥⌘ + u
  i = wm.cycleRight          -- ⌃⌥⌘ + i
})

-- display a keyboard hint for switching focus to each window
hk.bind(hyperWindow, 'w', function()
    hints.windowHints()
end)

-- Display current application window
hk.bind(hyperWindow, 'a', function()
    hints.windowHints(hs.window.focusedWindow():application():allWindows())
end)
