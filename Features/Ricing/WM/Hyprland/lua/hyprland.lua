require("configs.animations")
require("configs.binds")
require("configs.execs")
require("rules.windows")
require("rules.layers")

local function getHostname()
    local f = io.popen("hostname")
    local hostname = f:read("*a") or ""
    f:close()
    return string.gsub(hostname, "\n$", "")
end

local status, err = pcall(require, "hosts." .. getHostname())

hl.device({
    name = "asue1213:00-04f3:3283-touchpad",
    sensitivity = -0.100000,
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })

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
        dim_special = 0.100000,
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