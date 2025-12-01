{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.home-assistant = {
    enable = true;
    extraPackages = ps: with ps; [ psycopg2 ];
    # openFirewall = true;
    extraComponents = [
      "analytics"
      "backup"
      "bluetooth"
      "cast"
      "glances"
      "google_translate"
      "history"
      "history_stats"
      "met"
      "mobile_app"
      "radio_browser"
      "roborock"
      "shell_command"
      "shopping_list"
      "spotify"
      "tuya"
      "upnp"
      "isal"
      "wake_on_lan"
    ];
    customComponents = with pkgs.home-assistant-custom-components; [
      # dreo
    ];
    customLovelaceModules = with pkgs.home-assistant-custom-lovelace-modules; [
      bubble-card
      button-card
      card-mod
      light-entity-card
      mushroom
      mini-graph-card
      mini-media-player
    ];
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {
        logger = {
          default = "debug";
        };
      };

      # Automation, Scene, and Script from the UI
      "automation ui" = "!include automations.yaml";
      "scene ui" = "!include scenes.yaml";
      "script ui" = "!include scripts.yaml";
      "switch" = "!include switch.yaml";
      # These can be mixed with declarative configurations
      # "automation nixos" = [
      #   YAML automations go here
      # ];

      lovelace.mode = "yaml";
      recorder.db_url = "postgresql://@/hass";

      shell_command = {
        "suspend_pc" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl start systemd-suspend'";
        "hibernate_pc" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl hibernate'";
        "reboot_pc" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl reboot'";
        "poweroff_pc" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl poweroff'";
        "auto_push" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'aps'";
        "auto_pull" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'apll'";
        "desktop_1" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 1'";
        "desktop_2" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 2'";
        "desktop_3" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 3'";
        "desktop_4" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 4'";
        "desktop_5" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 5'";
        "desktop_6" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 6'";
        "modo_tele" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'modo-tele enable'";
        "modo_monitor" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'modo-tele disable'";
        "reboot_to_windows" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'reboot-to-windows'";
        "gamescope" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'start-gamescope-session'";
        "display_device_steamdeck" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled  'display-device -d steamdeck'";
        "display_device_pc_gambled" = "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled  'display-device -d pc-gambled'";
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