# Home manager file
{ ... }: {
  # https://wiki.hypr.land/Configuring/Variables/#input
  # https://wiki.hypr.land/Configuring/Variables/#gestures
  # See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
  wayland.windowManager.hyprland.settings = {
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

    device = {
      name = "asue1213:00-04f3:3283-touchpad";
      sensitivity = -1;
    };

    # gestures = {
    #   workspace_swipe = false;
    # };   
  };
}