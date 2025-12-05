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
      "switch"
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
          mac = "10:FF:E0:AB:9B:CB";
          host = "192.168.1.21";
          turn_off = {
            service = "shell_command.poweroff_pc";
          };
        }
      ];

      # These can be mixed with declarative configurations
      # "automation nixos" = [
      #   YAML automations go here
      # ];

      lovelace.mode = "yaml";
      recorder.db_url = "postgresql://@/hass";

      shell_command = {
        "suspend_pc" = "sudo ${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl start systemd-suspend'";
        "hibernate_pc" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl hibernate'";
        "reboot_pc" = "sudo ${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl reboot'";
        "poweroff_pc" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'sudo systemctl poweroff'";
        # "auto_push" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'aps'";
        # "auto_pull" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'apll'";
        # "desktop_1" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 1'";
        # "desktop_2" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 2'";
        # "desktop_3" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 3'";
        # "desktop_4" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 4'";
        # "desktop_5" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 5'";
        # "desktop_6" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'qdbus org.kde.KWin /KWin setCurrentDesktop 6'";
        "modo_tele" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'modo-tele enable'";
        "modo_monitor" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'modo-tele disable'";
        "reboot_to_windows" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'reboot-to-windows'";
        # "gamescope" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled 'start-gamescope-session'";
        "display_device_steamdeck" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled  'display-device -d steamdeck'";
        "display_device_pc_gambled" = "${pkgs.openssh}/bin/ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no gambled@pc-gambled  'display-device -d pc-gambled'";
        "touch_file" = "touch ~/test.txt";
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