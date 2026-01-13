# Home manager file
{ lib, ... }: {
  # https://wiki.hypr.land/Configuring/Variables/#general
  # https://wiki.hypr.land/Configuring/Variables/#decoration
  # https://wiki.hypr.land/Configuring/Dwindle-Layout/
  # https://wiki.hypr.land/Configuring/Master-Layout/
  # https://wiki.hypr.land/Configuring/Variables/#misc
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 0;
      border_size = 1;

      "col.active_border" = lib.mkForce "rgba(98971aee) rgba(b8bb26ee)";
      # "col.inactive_border" =  "rgba(595959aa)";

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = false;

      # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      rounding_power = 5;

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
        size = 5;
        passes = 2;
        new_optimizations = true;
        # contrast = 0.8316;
        # brightness = 0.8872;
        vibrancy = 0.1696;
        # vibrancy_darkness = 0.0;
        popups = true;
      };
    };

    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    master = {
      new_status = "master";
    };

    misc = {
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      vrr = 1;
    };
  };
}