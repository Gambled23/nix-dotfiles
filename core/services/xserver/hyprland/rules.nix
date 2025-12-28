# Home manager file
{ ... }: {
  # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
  # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Set default workspaces for apps
      "workspace 10, class:^(spotify)$"
      "workspace 9, class:^(vesktop)$"
      "workspace 9, class:^(Altus)$"
      "workspace 8, class:^(steam)$"
      "workspace 7, class:^(stremio)$"
      "workspace 7, class:^(miru)$"

      # Steam fullscrenn
      "fullscreen, class:^(steam)$"

      # Ignore focus on autostart apps
      "noinitialfocus, class:^(steam|spotify|vesktop|Altus)$"

      # Ignore maximize requests from apps. You'll probably like this.
      "suppressevent maximize, class:.*"

      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,pinned:0"

      # Always set opacity for these apps
      "opacity 0.86, class:^(kitty|org.kde.dolphin|gjs|DBeaver)$" 
      "opacity 0.9, class:^(spotify)$" 
      # Opacity only on focus loss
      "opacity 1 0.9, class:^(code)$"

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
}