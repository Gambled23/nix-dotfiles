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
      monitor = [
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
        "eDP-1,1920x1200@60,-1920x0, 1"
        # "HDMI-A-1, addreserved, 24, 24, 38, 38"
      ];
      "exec-once" = [
        "hyprlock"
      ];

      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:HDMI-A-1"
        "9, monitor:HDMI-A-1"
        "10, monitor:HDMI-A-1"
      ];
    };
  };

  services.hypridle.settings.listener = [
    { # 10 min turn dim screen
      timeout = 600;
      on-timeout = "brightnessctl -s set 10";
      on-resume = "brightnessctl -r";
    }
    { # 15 min lock screen
      timeout = 900;
      on-timeout = "hyprlock";
    }
    { # 60 min suspend pc
      timeout = 3600;
      on-timeout = "systemctl suspend";
    }
  ];
}
