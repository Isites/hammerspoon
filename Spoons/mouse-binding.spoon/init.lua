local hk = require "hs.hotkey"
local hyper      = {'cmd'}
-- Move Mouse to center of next Monitor
hk.bind(hyper, '`', function()
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)
 
    hs.mouse.setAbsolutePosition(center)
end)