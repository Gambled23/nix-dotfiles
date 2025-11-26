# Home manager file
{ ... }: {
  # https://wiki.hypr.land/Configuring/Variables/#animations
  wayland.windowManager.hyprland.settings.animations = {
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
}