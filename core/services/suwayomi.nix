{ config, lib, pkgs, ... }:

with lib;

{
  services.suwayomi-server = {
    enable = true;
    openFirewall = true;
    settings = {
      server.systemTrayEnabled = true;
      server.extensionRepos = [ "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json" ]; 
    };
  };
}
