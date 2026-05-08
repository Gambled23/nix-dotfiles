# Home manager file
{ lib, pkgs, ... }:
{
  # https://wiki.hypr.land/Configuring/Variables/#general
  # https://wiki.hypr.land/Configuring/Variables/#decoration
  # https://wiki.hypr.land/Configuring/Dwindle-Layout/
  # https://wiki.hypr.land/Configuring/Master-Layout/
  # https://wiki.hypr.land/Configuring/Variables/#misc
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 1;
      gaps_out = 2;
      border_size = 1;

      # "col.active_border" = lib.mkForce "${colorPrimary}";
      # "col.inactive_border" =  "rgba(595959aa)";

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = true;

      # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";

      snap = {
        enabled = true;
      };
    };

    decoration = {
      rounding = 10;
      rounding_power = 5;

      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      dim_special = 0.5;

      shadow = {
        enabled = true;
        range = 7;
        render_power = 5;
      };

      # https://wiki.hypr.land/Configuring/Variables/#blur
      blur = {
        enabled = true;
        popups = true;
        special = true;
        noise = 0;
        new_optimizations = true;
        size = 5;
        passes = 3;
        vibrancy = 0.8;
        contrast = 1.0;
        brightness = 1.0;
        vibrancy_darkness = 0.05;
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
      # vrr = 1;
    };
  };
}
