{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    plugins = {
      auto_update = true;
      enabled = [ "gambled23/mangowm-keymode" "avivbintangaringga/nix-monitor" "dotnetrob/cat" "pozzoo/hassio" "icefish/phone-connect" ];
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
