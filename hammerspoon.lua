-- multiline align cmd+ctrl+a

-- TODO: add mods & app filtering for hyper keys

local console = hs.logger.new('hammerspoon','debug')
local hyper = hs.hotkey.modal.new({}, 'F19', nil)
local trace = false

local globalHotkeys = {
  {{'cmd'}, 'escape',     {'cmd'}, '`', ''}, -- switch windows
  {{'cmd'}, '=',          {'cmd'}, 'f12', 'IntelliJ IDEA'}, -- idea list class
  {{'cmd', 'shift'}, '6', {'shift'}, 'f6', 'IntelliJ IDEA'}, -- idea rename
  {{'shift'}, 'escape',   {'shift'}, '`', ''}, -- print ~
  {{"cmd"}, "up",         {}, 'pageup', ''}, -- cmd+up = pageup
  {{"cmd"}, "down",       {}, 'pagedown', ''}, -- cmd+up = pageup
}
local apps = {
  {'b', 'Opera', 'Browser'},
  {'o', 'Opera', 'Opera'},
  {'i', 'IntelliJ IDEA', 'IDE'},
  {'s', 'Slack', 'Slack'},
  {'e', 'Sublime Text', 'Editor'},
  {'c', 'IntelliJ IDEA', 'Code'},
  {'t', 'iTerm', 'Terminal'},
  -- {'m', 'Mail', '🙀 eMails'},
  {'m', 'Spotify', '👩🏻‍🎤'},
}
local hotkeys = {
  {'1', 'f1'},
  {'2', 'f2'},
  {'3', 'f3'},
  {'4', 'f4'},
  {'5', 'f5'},
  {'6', 'f6'},
  {'7', 'f7'},
  {'8', 'f8'},
  {'9', 'f9'},
  {'0', 'f10'},
  {'-', 'f11'},
  {'=', 'f12'},
  {'escape', '`'},
}

function log(message)
  if trace then hs.alert(message) end
end

function globalHotkey(fromMods, fromKey, toMods, toKey, app)
  hs.hotkey.bind(fromMods, fromKey, function()
    -- console.i("hotkey ", fromKey, " -> ", toKey)
    if app == '' or hs.application.frontmostApplication():name() == app then
      -- log(table.concat(toMods, '-') .. ' + ' .. toKey)
      hs.eventtap.keyStroke(toMods, toKey)
    else
      hs.eventtap.keyStroke(fromMods, fromKey)
    end
  end)
end

hyper.app = function(key, app, message)
  message = message or app
  hyper:bind('', key, message, function()
    hs.application.launchOrFocus(app)
  end)
end

hyper.hyperKey = function(fromKey, toKey)
  hyper:bind('', fromKey, nil, function()
    hs.eventtap.keyStroke({}, toKey)
  end)
end

for _, values in ipairs(globalHotkeys) do
  local fromMods, fromKey, toMods, toKey, app = table.unpack(values)
  globalHotkey(fromMods, fromKey, toMods, toKey, app)
end

for _, values in ipairs(apps) do
  local key, app, message = table.unpack(values)
  hyper.app(key, app, message)
end

for _, values in ipairs(hotkeys) do
  local fromKey, toKey = table.unpack(values)
  hyper.hyperKey(fromKey, toKey)
end

hs.hotkey.bind({}, 'F20', function()
  -- log 'Entered Hyper'
  hyper:enter()
end, function()
  -- log 'Exited Hyper'
  hyper:exit()
end)
