{ config, pkgs, lib, inputs, outputs, ... }:
let 
  ssh_command = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled ";
  pc_host = "192.168.1.25";
  pc_mac = "10:FF:E0:AB:9B:CB";
in
{
  # systemctl --user stop openclaw-gateway
  services.home-assistant = {
    enable = true;
    configDir = "/var/lib/hass";
    extraPackages = ps: with ps; [ psycopg2 ];

    themes = with pkgs.home-assistant-themes; [
      material-you-theme
    ];
    # openFirewall = true;
    extraComponents = [
      "analytics"
      "androidtv"
      "androidtv_remote"
      "backup"
      "bluetooth"
      # "bluetooth"
      "cast"
      "fitbit"
      "glances"
      "google_translate"
      "history"
      "history_stats"
      "met"
      "mobile_app"
      "roborock"
      "shell_command"
      "spotify"
      "switch"
      "syncthing"
      "tuya"
      "upnp"
      "isal"
      "wake_on_lan"
    ];

    customComponents = with pkgs; [
      (callPackage ../../Pkgs/cozylife/package.nix {})
      home-assistant-custom-components.dreo
      home-assistant-custom-components.scheduler
    ];
    customLovelaceModules = with pkgs.home-assistant-custom-lovelace-modules; [
      bubble-card
      mushroom
      navbar-card
      material-you-utilities
    ];
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {
      };
      
      logger = {
        default = "error";
      };

      # Automation, Scene, and Script from the UI
      "automation ui" = "!include automations.yaml";
      "scene ui" = "!include scenes.yaml";
      "script ui" = "!include scripts.yaml";
      # "switch" = "!include switch.yaml";
      "switch" = [
        {
          platform = "wake_on_lan";
          name = "pc-gambled";
          mac = pc_mac;
          host = pc_host;
          turn_off = {
            service = "shell_command.poweroff_pc";
          };
        }
      ];   

      hass_cozylife_local_pull = {
        lang = "en";
        ip = [
          "192.168.1.3"
        ];
      };

      # These can be mixed with declarative configurations
      # "automation nixos" = [
      #   YAML automations go here
      # ];

      recorder.db_url = "postgresql://@/hass";

      shell_command = {
        "suspend_pc" = ssh_command + "'sudo systemctl start systemd-suspend'";
        "hibernate_pc" = ssh_command + "'sudo systemctl hibernate'";
        "reboot_pc" = ssh_command + "'sudo systemctl reboot'";
        "poweroff_pc" = ssh_command + "'sudo systemctl poweroff'";
        "desktop_1" = ssh_command + "'hyprctl dispatch workspace 1'";
        "desktop_2" = ssh_command + "'hyprctl dispatch workspace 2'";
        "desktop_3" = ssh_command + "'hyprctl dispatch workspace 3'";
        "desktop_4" = ssh_command + "'hyprctl dispatch workspace 4'";
        "desktop_5" = ssh_command + "'hyprctl dispatch workspace 5'";
        "desktop_6" = ssh_command + "'hyprctl dispatch workspace 6'";
        "desktop_7" = ssh_command + "'hyprctl dispatch workspace 7'";
        "desktop_8" = ssh_command + "'hyprctl dispatch workspace 8'";
        "desktop_9" = ssh_command + "'hyprctl dispatch workspace 9'";
        "desktop_10" = ssh_command + "'hyprctl dispatch workspace 10'";
        "reboot_to_windows" = ssh_command + "'reboot-to-windows'";
        "display_device_steamdeck" = ssh_command + "'display-device -d steamdeck'";
        "display_device_pc_gambled" = ssh_command + "'display-device -d pc-gambled'";
      };

      panel_custom = {
        name = "material-you-panel";
        url_path = "material-you-configuration";
        sidebar_title = "Material You Utilities";
        sidebar_icon = "mdi:material-design";
        module_url = "/local/nixos-lovelace-modules/material-you-utilities.min.js";
      };
    };

    # configWritable = true;
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "hass" ];
    ensureUsers = [{
      name = "hass";
      ensureDBOwnership = true;
    }];
  };

  networking.firewall.allowedTCPPorts = [
    config.services.home-assistant.config.http.server_port
  ];
}
