{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    plugins = {
      auto_update = "all";
      enabled = [ "gambled23/mangowm-keymode" "avivbintangaringga/nix-monitor" "icefish/phone-connect" "yocraft/battery-widget" "noctalia/wallhaven" "alexander/screen-toolkit" "ezequiel/mango_layouts" "weinguyen/procmon" "aristides/udiskie" "apex077/eyecare" "tphilippot/git_companion" "raycursive/discord-voice" "noctalia/wallpaper_depth" ];
      source = [ {
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
        name = "official";
      } {
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/community-plugins";
        name = "community";
      } {
        enabled = false;
        kind = "path";
        location = "~/Codes/community-plugins/";
        name = "xxxx";
      } ];
    };
  };
}
