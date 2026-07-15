{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    wallpaper = {
      directory = "/home/gambled/Pictures/Wallpapers";
      directory_dark = "";
      directory_light = "";
      edge_smoothness = 0.30000001192092896;
      enabled = true;
      fill_color = "";
      fill_mode = "crop";
      per_monitor_directories = true;
      transition = [ "fade" "wipe" "disc" "stripes" "zoom" "honeycomb" ];
      transition_duration = 1500.0;
      transition_on_startup = true;
      automation = {
        enabled = false;
        interval_seconds = 86400;
        order = "random";
        recursive = true;
      };
      monitor = {
        DP-3 = {
          directory = "/home/gambled/Pictures/Wallpapers/Ultrawide";
          match = "DP-3";
        };
        HDMI-A-1 = {
          directory = "/home/gambled/Pictures/Wallpapers/Wide";
          match = "HDMI-A-1";
        };
        eDP-1 = {
          directory = "/home/gambled/Pictures/Wallpapers/Wide";
          match = "eDP-1";
        };
      };
    };
  };
}
