# Home manager file
{ ... }: {
  # See https://wiki.hypr.land/Configuring/Keywords/
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, Q, killactive,"
      # "$mainMod, G, hyprexpo:expo, toggle"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, R, exec, $menu"
      "$mainMod, O, exec, openrgb --profile 'off.orp'"
      "$mainMod, P, exec, display-device -d pc-gambled" # dwindle
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, F, exec, $web_browser"
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, C, exec, $code"
      "$mainMod, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
      "$mainMod, B, exec, vicinae vicinae://extensions/vicinae/bluetooth/devices"
      # "$mainMod, B, exec, bluetoothctl connect 24:95:2F:60:BD:94"
      "$mainMod, L, exec, hyprlock"
      "$mainMod, N, togglefloating,"
      "$mainMod, M, exit,"

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
      "$mainMod, TAB, workspace, previous"

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
      "$mainMod, S, togglespecialworkspace, S"
      "$mainMod SHIFT, S, movetoworkspace, special:S"
      "$mainMod, A, togglespecialworkspace, A"
      "$mainMod SHIFT, A, movetoworkspace, special:A"
      "$mainMod, D, togglespecialworkspace, D"
      "$mainMod SHIFT, D, movetoworkspace, special:D"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e-1"
      "$mainMod, mouse_up, workspace, e+1"
    ];

    binde = [
      # Media controller
      "ALT, 0, exec, pamixer -i 1 && paplay /etc/nixos/core/services/xserver/hyprland/volume.mp3"
      "ALT, 9, exec, pamixer -d 1 && paplay /etc/nixos/core/services/xserver/hyprland/volume.mp3"
      "ALT, 8, exec, pamixer -t"
      "ALT, 1, exec, playerctl previous"
      "ALT, 2, exec, playerctl play-pause"
      "ALT, 3, exec, playerctl next"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}