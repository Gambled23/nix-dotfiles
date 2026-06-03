hl.window_rule({
    match = {
        class = "^(discord)$",
    },
    workspace = "8",
})

hl.workspace_rule({
    workspace = "1",
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "2",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "8",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "9",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "10",
    monitor = "HDMI-A-1",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlock")
end)


hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "-1920x0",
    scale = "1",
})