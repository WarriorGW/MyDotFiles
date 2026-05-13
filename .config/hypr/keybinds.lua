-- Programs
local terminal = "kitty"
local fileManager = "dolphin"
local brave = "brave"
local firefox = "firefox"
local hyprpicker = "hyprpicker -a"
local ipc = "qs -c noctalia-shell ipc call "

local mainMod = "SUPER"
local shiftMod = mainMod .. "+ SHIFT"
local ctrlMod = "CTRL + " .. mainMod


local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())

-- Applications
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(brave))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(firefox))

-- Window management
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Workspaces
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:magic" }))

-- Noctalia shell keybinds
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(ipc .. "sessionMenu toggle"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. "controlCenter toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness increase"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness decrease"),
  { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume increase"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume muteOutput"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. "media previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media playPause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(ipc .. "media stop"))


-- Change keyboard layout
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl switchxkblayout at-translated-set-2-keyboard next"))

-- Hyprpicker and screenshot
hl.bind(shiftMod .. " + C", hl.dsp.exec_cmd(hyprpicker))
hl.bind(ctrlMod .. " + S", hl.dsp.exec_cmd("hyprshot -z -m region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -z -m window"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m active -m output"))

-- Mouse
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
