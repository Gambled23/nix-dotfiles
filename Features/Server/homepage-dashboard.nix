{ config, pkgs, lib, ... }:

{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8082;
    allowedHosts = "*";

    services = [
      {
        "Server" = [
          {
            "Syncthing" = {
              icon = "syncthing";
              href = "http://server-gambled/syncthing";
              siteMonitor = "http://server-gambled/syncthing";
              # widget = {
              #   type = "strelaysrv";
              #   url = "http://0.0.0.0:8384";
              # };
            };
          }
          {
            "Homeassistant" = {
              icon = "home-assistant";
              href = "http://server-gambled/home";
              siteMonitor = "http://server-gambled/home";
            };
          }
          {
            "Code server" = {
              icon = "code";
              href = "http://server-gambled/code-server";
              siteMonitor = "http://server-gambled/code-server";
            };
          }
          {
            "Nginx" = {
              icon = "nginx";
              href = "http://server-gambled";
              siteMonitor = "http://server-gambled";
            };
          }
          {
            "Paperless" = {
              icon = "paperless";
              href = "https://server-gambled/paperless";
              siteMonitor = "https://server-gambled/paperless";
            };
          }
        ];
      }
      {
        "PC" = [
          {
            "Syncthing" = {
              icon = "syncthing";
              href = "http://pc-gambled:8384";
              siteMonitor = "http://pc-gambled:8384";
            };
          }
          {
            "Ollama" = {
              icon = "ollama";
              href = "http://pc-gambled:11434/";
              siteMonitor = "http://pc-gambled:11434/";
            };
          }
          # 47989 port for the streaming service, 47990 for the web interface
          {
            "Sunshine" = {
              icon = "sunshine";
              href = "https://pc-gambled:47990/";
              siteMonitor = "https://pc-gambled:47990/";
            };
          }
        ];
      }
      {
        "Dev" = [
          {
            "Syncthing" = {
              icon = "syncthing";
              href = "http://dev-gambled:8384";
              siteMonitor = "http://dev-gambled:8384";
            };
          }
        ];
      }
    ];
  };
}
