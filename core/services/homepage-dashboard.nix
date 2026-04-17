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
              href = "http://server-gambled:8384";
              siteMonitor = "http://server-gambled:8384";
              # widget = {
              #   type = "strelaysrv";
              #   url = "http://0.0.0.0:8384";
              # };
            };
          }
          {
            "Homeassistant" = {
              icon = "home-assistant";
              href = "http://server-gambled:8123";
              siteMonitor = "http://server-gambled:8123";
            };
          }
          {
            "Code server" = {
              icon = "code";
              href = "http://server-gambled:4444";
              siteMonitor = "http://server-gambled:4444";
            };
          }
          {
            "Nginx" = {
              icon = "nginx";
              href = "https://server-gambled:443";
              siteMonitor = "https://server-gambled:443";
            };
          }
          {
            "Paperless" = {
              icon = "paperless";
              href = "https://server-gambled:28981";
              siteMonitor = "https://server-gambled:28981";
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
