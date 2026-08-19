{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    plugins = {
      auto_update = true;
      enabled = [ "noctalia/wallhaven" "gambled23/mangowm-keymode" "avivbintangaringga/nix-monitor" "icefish/phone-connect" "ezequiel/mango_layouts" "nomadcxx/gamer-mode" "blackbartblues/audio-switcher" "alexander/screen-toolkit" "raycursive/discord-voice" "cleboost/anilist" ];
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
