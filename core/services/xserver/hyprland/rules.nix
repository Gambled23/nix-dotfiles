# Home manager file
{ ... }: {
  # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
  # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Set default workspaces for apps
      "match:class ^(spotify)$, workspace 10"
      "match:class ^(vesktop)$, workspace 9"
      "match:class ^(Altus)$, workspace 9"
      "match:class ^(steam)$, workspace 8"
      "match:class ^(stremio)$, workspace 7"
      "match:class ^(miru)$, workspace 7"

      # Steam fullscrenn
      # "match:class ^(steam)$, fullscreen on"

      # Ignore focus on autostart apps
      "match:class ^(steam|spotify|vesktop|Altus)$, no_initial_focus on"

      # Ignore maximize requests from apps. You'll probably like this.
      " match:class .*, suppress_event maximize"

      # Fix some dragging issues with XWayland
      " match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:pin 0"

      # Always set opacity for these apps
      "match:class ^(kitty|org.kde.dolphin|gjs|DBeaver)$, opacity 0.86" 
      "match:class ^(spotify)$, opacity 0.9" 
      # Opacity only on focus loss
      "match:class ^(code)$, opacity 1 0.9"

    ];

    layerrule = [
      "match:namespace bar-0, blur on"
      "match:namespace verification, blur on"
      "match:namespace vicinae, blur on, ignore_alpha 0"
      "match:namespace dashboardmenu, blur on, ignore_alpha 0"
      "match:namespace mediamenu, blur on, ignore_alpha 0"
      "match:namespace audiomenu, blur on, ignore_alpha 0"
      "match:namespace networkmenu, blur on, ignore_alpha 0"
      "match:namespace bluetoothmenu, blur on, ignore_alpha 0"
      "match:namespace energymenu, blur on, ignore_alpha 0"
      "match:namespace calendarmenu, blur on, ignore_alpha 0"
      "match:namespace notificationsmenu, blur on, ignore_alpha 0"
      "match:namespace indicator, blur on, ignore_alpha 0"
      "match:namespace ashell-main-layer, blur on, ignore_alpha 0"
      "match:namespace swaync-control-center, blur on, ignore_alpha 0"
      "match:namespace swaync-notification-window, blur on, ignore_alpha 0"
      "match:namespace quickshell, blur on, ignore_alpha 0.3"
    ];
  };
}