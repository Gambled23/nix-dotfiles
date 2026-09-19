{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    plugins = {
      auto_update = "all";
      enabled = [ "noctalia/wallhaven" "gambled23/mangowm-keymode" "icefish/phone-connect" "ezequiel/mango_layouts" "alexander/screen-toolkit" "raycursive/discord-voice" "cleboost/anilist" "pozzoo/hassio" "yocraft/custom-shortcut" "mindnbytes/nix-status" "yocraft/desktop-launcher" "dunarand/bookmarks" ];
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
