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

      monitor = ["DP-3,3440x1440@180,0x0,1" "HDMI-A-1, 1920x1080@60.00Hz, 0x0, 1, mirror, DP-3"];

      "exec-once" = [
        "openrgb --profile 'off.orp'"
        "uwsm app -- steam %U"
      ];
    };
  };
}