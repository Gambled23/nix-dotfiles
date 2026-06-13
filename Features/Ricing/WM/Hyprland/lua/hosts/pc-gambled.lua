
-- hl.monitor({
--     output = "DP-3",
--     mode = "3440x1440@180",
--     position = "0x0",
--     scale = "1",
-- })

-- hl.monitor({
--     output = "sunshine",
--     disabled = true,
-- })

hl.window_rule({
    match = {
        class = "^(discord)$",
    },
    workspace = "9",
})

hl.on("hyprland.start", function()
    hl.exec_cmd("steam %U")
    hl.exec_cmd("hyprctl output create headless sunshine")
    hl.exec_cmd("display-device -d pc-gambled")
end)
