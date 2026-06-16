
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

-- When a monitor becomes active (added/enabled), migrate ALL workspaces to it.
-- This is needed because Hyprland does not automatically move workspaces off a
-- *disabled* monitor (unlike a physically disconnected one). Without this, windows
-- get stranded on the dead output and are inaccessible.
local function migrate_all_workspaces_to(monitor_name)
    local workspaces = hl.get_workspaces()
    for _, ws in ipairs(workspaces) do
        -- Skip special/scratchpad workspaces (id < 0)
        if ws.id > 0 then
            hl.dispatch(hl.dsp.workspace.move({ workspace = ws.id, monitor = monitor_name }))
        end
    end
end

hl.on("monitor.added", function(monitor)
    if monitor.name == "sunshine" or monitor.name == "DP-3" then
        migrate_all_workspaces_to(monitor.name)
    end
end)

