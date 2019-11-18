local hk = require "hs.hotkey"
local hm = require "hs.menubar"
local mouse = require "hs.mouse"
local input = require "hs.eventtap"
local keycodes = require "hs.keycodes"
local app = require "hs.application"
local timer = require "hs.timer"
local hyper      = {'cmd', 'shift'}

local terminal = 'terminal'



function openApp(name)
	-- todo 现在总是返回nil
	local handleApp = app.get(name)
	if handleApp == nil then
		handleApp = app.open(name, 0, true)
	else
		handleApp:activate()
	end
	return handleApp
end

app.enableSpotlightForNameSearches(true)

autoMenu = hm.new(false):setMenu({
	{
		title = "Nice Show",
		fn = function()
			hs.alert.show('Master is handsome!')
		end
	}
})


-- 打开popmenubar
hk.bind(hyper, 'm', function()
    local point = mouse.getAbsolutePosition()
    autoMenu:popupMenu(point)
end)