{ config, lib, pkgs, ... }:

with lib;

{
  services.suwayomi-server = {
    enable = true;
    openFirewall = true;

    settings = {
      server.systemTrayEnabled = true;
      server.extensionRepos = [ "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json" ]; 
      server.webUIEnabled = true;
      server.initialOpenInBrowserEnabled = true;
      server.webUIInterface = "browser"; # "browser" or "electron"
      server.webUIFlavor = "WebUI"; # "WebUI" or "Custom"
      server.basicAuthEnabled = false;
      server.port = 4567;
    };
  };
}
