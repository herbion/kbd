-- multiline align cmd+ctrl+a

local hyper = {"cmd", "alt", "ctrl","shift"}

local hotkeys = {
  {{'cmd'}, 'escape',     {'cmd'}, '`'}, -- switch windows
  {{'cmd'}, '=',          {'cmd'}, 'f12'}, -- idea open class
  {{'cmd', 'shift'}, '6', {'shift'}, 'f6'}, -- idea rename
  {{'shift'}, 'escape',   {'shift'}, '`'}, -- print ~
  {{"cmd"}, "up",         {}, 'pageup'}, -- cmd+up = pageup
  {{"cmd"}, "down",       {}, 'pagedown'}, -- cmd+up = pageup
  {hyper, '1',            {}, 'f1'}, -- f1
  {hyper, '2',            {}, 'f2'}, -- f2
  {hyper, '3',            {}, 'f3'}, -- f3
  {hyper, '4',            {}, 'f4'}, -- f4
  {hyper, '5',            {}, 'f5'}, -- f5
  {hyper, '6',            {}, 'f6'}, -- f6
  {hyper, '7',            {}, 'f7'}, -- f7
  {hyper, '8',            {}, 'f8'}, -- f8
  {hyper, '9',            {}, 'f9'}, -- f9
  {hyper, '0',            {}, 'f10'}, -- f10
  {hyper, '-',            {}, 'f11'}, -- f11
  {hyper, '=',            {}, 'f12'}, -- f12
  {hyper, 'escape',       {}, '`'}, -- print `
}

for _, hotkeyVals in ipairs(hotkeys) do
  	local fromMods, fromKey, toMods, toKey = table.unpack(hotkeyVals)
	hs.hotkey.bind(fromMods, fromKey, function()
		hs.eventtap.keyStroke(toMods, toKey)
	end)
end
