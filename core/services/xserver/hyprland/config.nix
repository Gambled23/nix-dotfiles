# Home manager file
{
  inputs,
  pkgs,
  ...
}: 
{
  imports = [
    ./hyprsunset.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprshot.nix
    ./hyprpanel.nix
    ./hyprlock.nix
    ./kitty.nix
    ./menu/vicinae.nix
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
      inputs.hyprland-plugins.packages."${pkgs.system}".csgo-vulkan-fix
    ];

    settings = {
      # This is an example Hyprland config file for Nix.
      # Refer to the wiki for more information.
      # https://wiki.hypr.land/Configuring/
      # https://wiki.hypr.land/Nix/
      # https://wiki.hypr.land/Nix/Hyprland-on-NixOS/
      # https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/

      # Please note not all available settings / options are set here.
      # For a full list, see the wiki

      # You can split this configuration into multiple files
      # Create your files separately and then link them to this file like this:
      # source = ~/.config/hypr/myColors.conf
      # todo: make the line above nix-ish

      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Keywords/

      # Set programs that you use

      "$terminal" = "uwsm app -- kitty";
      "$fileManager" = "uwsm app -- dolphin";
      "$web_browser" = "uwsm app -- google-chrome-stable";
      "$code" = "uwsm app -- code";
      "$menu" = "uwsm app -- vicinae toggle";


      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

      "exec-once" = [
        # "systemctl --user enable --now hyprpolkitagent.service"
        # "mako"
        # "systemctl --user enable --now waybar.service"
        "systemctl --user enable --now hyprpaper.service"
        "systemctl --user enable --now hypridle.service"
        "uwsm app -- hyprpanel"
        "uwsm app -- spotify %U"
        "uwsm app -- vesktop %U"
        "uwsm app -- altus %U"
        "bluetoothctl connect 24:95:2F:60:BD:94"
      ];


      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hypr.land/Configuring/Environment-variables/

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];


      ###################
      ### PERMISSIONS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Permissions/
      # Please note permission changes here require a Hyprland restart and are not applied on-the-fly
      # for security reasons

      # ecosystem = {
      #   enforce_permissions = 1;
      # };

      permission = [
        "/usr/(bin|local/bin)/grim, screencopy, allow"
        "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow"
        "/usr/(bin|local/bin)/hyprpm, plugin, allow"
      ];


      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hypr.land/Configuring/Variables/

      # https://wiki.hypr.land/Configuring/Variables/#general
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;

        # "col.active_border" = "rgba(99cc00ee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hypr.land/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };

        # https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          new_optimizations = true;
          vibrancy = 0.1696;
          popups = true;
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#animations
      animations = {
        enabled = "yes, please :)";

        #* Smooth
          # bezier = [
          #   "overshot, 0.05, 0.9, 0.1, 1.05"
          #   "smoothOut, 0.5, 0, 0.99, 0.99"
          #   "smoothIn, 0.5, -0.5, 0.68, 1.5"
          # ];
          # animation = [
          #   "windows, 1, 5, overshot, slide"
          #   "windowsOut, 1, 3, smoothOut"
          #   "windowsIn, 1, 3, smoothOut"
          #   "windowsMove, 1, 4, smoothIn, slide"
          #   "border, 1, 5, default"
          #   "fade, 1, 5, smoothIn"
          #   "fadeDim, 1, 5, smoothIn"
          #   "workspaces, 1, 6, default"
          # ];

        #* Fast
          bezier = [
            "linear, 0, 0, 1, 1"
            "md3_standard, 0.2, 0, 0, 1"
            "md3_decel, 0.05, 0.7, 0.1, 1"
            "md3_accel, 0.3, 0, 0.8, 0.15"
            "overshot, 0.05, 0.9, 0.1, 1.1"
            "crazyshot, 0.1, 1.5, 0.76, 0.92 "
            "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
            "fluent_decel, 0.1, 1, 0, 1"
            "easeInOutCirc, 0.85, 0, 0.15, 1"
            "easeOutCirc, 0, 0.55, 0.45, 1"
            "easeOutExpo, 0.16, 1, 0.3, 1"
          ];
          animation = [
            "windows, 1, 3, md3_decel, popin 60%"
            "border, 1, 10, default"
            "fade, 1, 2.5, md3_decel"
            "workspaces, 1, 3.5, easeOutExpo, slide"
            "specialWorkspace, 1, 3, md3_decel, slidevert"
          ];      
      };

      # See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hypr.land/Configuring/Variables/#misc
      misc = {
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };



      #############
      ### INPUT ###
      #############

      # https://wiki.hypr.land/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = -0.8; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false;
        };
      };

      # https://wiki.hypr.land/Configuring/Variables/#gestures
      # gestures = {
      #   workspace_swipe = false;
      # };

      # Example per-device config
      # See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };


      ###################
      ### KEYBINDINGS ###
      ###################

      # See https://wiki.hypr.land/Configuring/Keywords/
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      bind = [
        # Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, R, exec, $menu"
        "$mainMod, O, exec, openrgb --profile 'off.orp'"
        "$mainMod, P, exec, display-device -d pc-gambled" # dwindle
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, F, exec, $web_browser"
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, C, exec, $code"
        "$mainMod, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
        "$mainMod, B, exec, bluetoothctl connect 24:95:2F:60:BD:94"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, N, togglefloating,"
        "$mainMod, M, exit,"

        # Media controller
        "ALT, 0, exec, pamixer -i 2 && paplay /etc/nixos/core/services/xserver/hyprland/volume.mp3"
        "ALT, 9, exec, pamixer -d 2 && paplay /etc/nixos/core/services/xserver/hyprland/volume.mp3"
        "ALT, 8, exec, pamixer -t"
        "ALT, 1, exec, playerctl previous"
        "ALT, 2, exec, playerctl play-pause"
        "ALT, 3, exec, playerctl next"

        # Tools
        ", Print, exec, hyprshot -m region"


        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Requires playerctl
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
      # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

      windowrule = [
        # Example windowrule
        "workspace 5, class:^(spotify)$"
        "workspace 2, class:^(vesktop)$"
        "workspace 2, class:^(Altus)$"
        "workspace 4, class:^(steam)$"
        "workspace 3, class:^(stremio)$"
        "workspace 3, class:^(miru)$"


        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "opacity 0.85, class:^(kitty|org.kde.dolphin)$"
        # "opacity 0.95, class:^(org.kde.dolphin)$"
      ];

      layerrule = [
        "blur, bar-0"
        "blur, verification"
        "blur, vicinae"
        "ignorealpha 0, vicinae"
        "blur, dashboardmenu"
        "ignorealpha 0, dashboardmenu"
        "blur, mediamenu"
        "ignorealpha 0, mediamenu"
        "blur, audiomenu"
        "ignorealpha 0, audiomenu"
        "blur, networkmenu"
        "ignorealpha 0, networkmenu"
        "blur, bluetoothmenu"
        "ignorealpha 0, bluetoothmenu"
        "blur, energymenu"
        "ignorealpha 0, energymenu"
        "blur, calendarmenu"
        "ignorealpha 0, calendarmenu"
        "blur, notificationsmenu"
        "ignorealpha 0, notificationsmenu"
        "blur, indicator"
        "ignorealpha 0, indicator"
      ];
      
    };
  };

}