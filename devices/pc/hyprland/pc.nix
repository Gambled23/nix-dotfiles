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

      monitor = [
        "DP-3,3440x1440@180,0x0,1"
        "sunshine, disable"
      ];

      "exec-once" = [
        "openrgb --profile 'off.orp'"
        "uwsm app -- steam %U"
      ];
    };
  };
}