
hl.window_rule({
    match = {
        class = "^(Spotify)$",
    },
    workspace = "10",
})

hl.window_rule({
    match = {
        class = "^(Altus)$",
    },
    workspace = "9",
})

hl.window_rule({
    match = {
        class = "^(steam)$",
    },
    workspace = "8",
})

hl.window_rule({
    match = {
        class = "^(eden)$",
    },
    workspace = "2",
})

hl.window_rule({
    match = {
        class = "^(com.stremio.stremio)$",
    },
    workspace = "7",
})

hl.window_rule({
    match = {
        class = "^(hayase)$",
    },
    workspace = "7",
})

hl.window_rule({
    match = {
        class = "^(com.moonlight_stream.Moonlight)$",
    },
    workspace = "2",
})

hl.window_rule({
    match = {
        class = "^(steam|spotify|discord|Altus)$",
    },
    no_initial_focus = true,
})

hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = 1,
        float = 1,
        pin = 0,
    },
})

hl.window_rule({
    match = {
        title = "(ripdrag)",
    },
    opacity = 0.7,
})

hl.window_rule({
    match = {
        class = "(mpv|vlc)",
    },
    float = true,
    center = true,
    keep_aspect_ratio = true,
    size = "284 160",
})

hl.window_rule({
    match = {
        class = ".scrcpy-wrapped",
    },
    float = true,
    center = true,
    min_size = "336 748",
    max_size = "1344 2992",
    size = "469 1044",
    keep_aspect_ratio = true,
})

hl.window_rule({
    match = {
        title = "Picture in picture",
    },
    float = true,
    center = true,
    keep_aspect_ratio = true,
    size = "284 160",
})

hl.window_rule({
    match = {
        title = "(Open File.*|Select Folder to Upload|Select a file|.*Yazi.*)",
    },
    size = "1150 700",
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        title = "(Keyguard)",
    },
    size = "790 570",
    min_size = "790 570",
    max_size = "791 571",
    float = true,
    center = true,
})

hl.window_rule({
    match = {
        title = "(Yazi.*)",
    },
    float = true,
    center = true,
    size = "600 400",
})

hl.window_rule({
    match = {
        float = false,
    },
    no_shadow = true,
})