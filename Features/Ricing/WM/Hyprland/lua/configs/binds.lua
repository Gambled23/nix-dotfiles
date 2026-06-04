local terminal = "ghostty"
local code = "uwsm app -- code"
local file_manager = terminal .. " -e yazi"
local mainMod = "SUPER"
local menu = "uwsm app -- vicinae toggle"
local web_browser = "uwsm app -- google-chrome-stable"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("uwsm app -- nautilus"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(web_browser))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(terminal .. " -e vim"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("noctalia-shell ipc call lockScreen lock"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("$termial -e nix-rbd"))
hl.bind(mainMod .. " + X", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("moonlight stream 'el sunchine' 'dev-gambled'"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("scrcpy --render-driver=opengl -S -w -K -b15M --power-off-on-close"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(terminal .. " -e btop"))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + A", hl.dsp.workspace.toggle_special("A"))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("S"))
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("D"))
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- For loop
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:A" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:S" }))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:D" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind("ALT + 0", hl.dsp.exec_cmd("pamixer -i 1"), { repeating = true })
hl.bind("ALT + 9", hl.dsp.exec_cmd("pamixer -d 1"), { repeating = true })
hl.bind("ALT + 8", hl.dsp.exec_cmd("pamixer -t"), { repeating = true })
hl.bind("ALT + 1", hl.dsp.exec_cmd("playerctl previous"), { repeating = true })
hl.bind("ALT + 2", hl.dsp.exec_cmd("playerctl play-pause"), { repeating = true })
hl.bind("ALT + 3", hl.dsp.exec_cmd("playerctl next"), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + Control_L", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
hl.bind(mainMod .. " + ALT_L", hl.dsp.window.resize())