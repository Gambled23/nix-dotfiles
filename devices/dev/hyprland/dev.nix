{
  inputs,
  pkgs,
  ...
}: 
{
  imports = [
    ../../../core/services/xserver/hyprland/config.nix
  ];
  wayland.windowManager.hyprland = {
    settings = {
      ################
      ### MONITORS ###
      ################

      # See https://wiki.hypr.land/Configuring/Monitors/

      monitor = "eDP-1,1920x1080@60,0x0,1";
      "exec-once" = [
        "hyprlock"
      ];
    };
  };

  services.hypridle.settings.listener = [
    { # 2.5 min turn dim screen
      timeout = 150;
      on-timeout = "brightnessctl -s set 10";
      on-resume = "brightnessctl -r";
    }
    { # 5 min turn off screen
      timeout = 300;
      on-timeout = "pidof hyprlock || hyprlock";
    }
    { # 30 min suspend pc
      timeout = 1800;
      on-timeout = "systemctl suspend";
    }
  ];
}