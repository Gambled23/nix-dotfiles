-- require('dev')

local function getHostname()
    local f = io.popen("hostname")
    local hostname = f:read("*a") or ""
    f:close()
    return string.gsub(hostname, "\n$", "")
end

local status, err = pcall(require, getHostname())

local terminal = "ghostty"
local code = "uwsm app -- code"
local file_manager = terminal .. " -e yazi"
local mainMod = "SUPER"
local menu = "uwsm app -- vicinae toggle"
local web_browser = "uwsm app -- google-chrome-stable"

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.5 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("fluent_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "popin 60%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2.5,
    bezier = "md3_decel",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3.5,
    bezier = "easeOutExpo",
    style = "slide",
})
hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 3,
    bezier = "md3_decel",
    style = "slidevert",
})

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
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:A" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:S" }))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:D" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

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

hl.device({
    name = "asue1213:00-04f3:3283-touchpad",
    sensitivity = -0.100000,
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.layer_rule({
    match = { namespace = "noctalia-.*" },
    blur = true,
    ignore_alpha = 0.5,
    blur_popups = true,
})

hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

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
        class = "^(stremio)$",
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
        class = "^(steam)$",
    },
    fullscreen = false,
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
        class = "(mpv)",
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

hl.config({
    animations = {
        enabled = true,
    },
    decoration = {
        blur = {
            brightness = 1.000000,
            contrast = 1.000000,
            enabled = true,
            new_optimizations = true,
            noise = 0,
            passes = 3,
            popups = true,
            size = 5,
            special = true,
            vibrancy = 0.800000,
            vibrancy_darkness = 0.050000,
        },
        shadow = {
            color = "rgba(28282899)",
            enabled = true,
            range = 7,
            render_power = 5,
        },
        active_opacity = 1.000000,
        dim_special = 0.500000,
        inactive_opacity = 1.000000,
        rounding = 10,
        rounding_power = 5,
    },
    dwindle = {
        preserve_split = true,
    },
    general = {
        snap = {
            enabled = true,
        },
        allow_tearing = false,
        border_size = 1,
        col = {
            active_border = "rgb(83a598)",
            inactive_border = "rgb(665c54)",
        },
        gaps_in = 1,
        gaps_out = 2,
        layout = "dwindle",
        resize_on_border = true,
    },
    group = {
        groupbar = {
            col = {
                active = "rgb(83a598)",
                inactive = "rgb(665c54)",
            },
            text_color = "rgb(d5c4a1)",
        },
        col = {
            border_active = "rgb(83a598)",
            border_inactive = "rgb(665c54)",
            border_locked_active = "rgb(8ec07c)",
        },
    },
    input = {
        touchpad = {
            natural_scroll = false,
        },
        follow_mouse = 1,
        kb_layout = "us",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        kb_variant = "altgr-intl",
        numlock_by_default = true,
        sensitivity = -0.800000,
    },
    master = {
        new_status = "master",
    },
    misc = {
        background_color = "rgb(282828)",
        disable_hyprland_logo = true,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- noctalia-shell")
    hl.exec_cmd("uwsm app -- spotify")
    hl.exec_cmd("uwsm app -- discord")
    hl.exec_cmd("uwsm app -- altus")
    hl.exec_cmd("uwsm app -- kdeconnect-indicator")
end)


