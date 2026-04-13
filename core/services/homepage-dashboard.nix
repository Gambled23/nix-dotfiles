{ config, pkgs, lib, ... }:

{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8082;
    allowedHosts = "*";

    services = [
      {
        "Dev" = [
          {
            "Homeassistant" = {
              icon = "home-assistant";
              href = "http://server-gambled:8123";
              siteMonitor = "http://server-gambled:8123";
            };
          }
          {
            "Syncthing" = {
              icon = "syncthing";
              href = "http://server-gambled:8384";
              siteMonitor = "http://server-gambled:8384";
              widget = {
                type = "strelaysrv";
                url = "http://0.0.0.0:8384";
              };
            };
          }
          {
            "Code server" = {
              icon = "code";
              href = "http://server-gambled:4444";
              siteMonitor = "http://server-gambled:4444";
            };
          }
        ];
      }
      # {
      #   "My Second Group" = [
      #     {
      #       "My Second Service" = {
      #         description = "Homepage is the best";
      #         href = "http://localhost/";
      #       };
      #     }
      #   ];
      # }
    ];
  };
}
