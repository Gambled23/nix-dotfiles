{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    plugins = {
      enabled = [ "gambled23/mangowm-keymode" "noctalia/wallhaven" ];
      source = [ {
        auto_update = false;
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
        name = "official";
      } {
        auto_update = false;
        enabled = true;
        kind = "git";
        location = "https://github.com/noctalia-dev/community-plugins";
        name = "community";
      } ];
    };
  };
}
