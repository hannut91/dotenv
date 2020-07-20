function open(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

function change_output_device() 
  local currentOutputDevice = hs.audiodevice.defaultOutputDevice()
  local devices = hs.audiodevice.allOutputDevices()

  local index = hs.fnutils.indexOf(devices, currentOutputDevice)

  local device

  if index == #devices then
    device = devices[1]
  else
    device = devices[index +1]
  end

  device:setDefaultOutputDevice()
  hs.alert(device:name())
end

function change_input_device() 
  local currentInputDevice = hs.audiodevice.defaultInputDevice()
  local devices = hs.audiodevice.allInputDevices()

  local index = hs.fnutils.indexOf(devices, currentInputDevice)

  local device

  if index == #devices then
    device = devices[1]
  else
    device = devices[index +1]
  end

  device:setDefaultInputDevice()
  hs.alert(device:name())
end

function lock_screen() 
  hs.caffeinate.systemSleep()
end

function window_left()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function window_right()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function window_full()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'k', open("KakaoTalk"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'c', open("Google Chrome"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 's', open("Safari"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 't', open("Terminal"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'f', open("Finder"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'n', open("Notion"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'v', open("Visual Studio Code"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'j', open("IntelliJ IDEA"))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'o', change_output_device)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'i', change_input_device)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'escape', lock_screen)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", window_left)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", window_right)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", window_full)

hs.hotkey.bind({'option', 'cmd'}, 'r', function() hs.reload() end)

hs.window.animationDuration = 0
