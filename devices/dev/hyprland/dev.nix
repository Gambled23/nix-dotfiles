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
    };
  };
}