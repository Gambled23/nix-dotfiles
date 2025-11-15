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
      # default_config = {

      # };

      # Automation, Scene, and Script from the UI
      "automation ui" = "!include automations.yaml";
      "scene ui" = "!include scenes.yaml";
      "switch" = "!include switch.yaml";

      # These can be mixed with declarative configurations
      # "automation nixos" = [
        # YAML automations go here
      # ];

      # lovelace.mode = "storage";
      recorder.db_url = "postgresql://@/hass";

      shell_command = {
        "suspend_pcsuspend_pc" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl start systemd-suspend'";
        "hibernate_pc" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl hibernate'";
        "reboot_pc" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl reboot'";
        "poweroff_pc" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl poweroff'";
        "auto_push" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'aps'";
        "auto_pull" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'apll'";
        "desktop_1" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 1'";
        "desktop_2" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 2'";
        "desktop_3" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 3'";
        "desktop_4" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 4'";
        "desktop_5" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 5'";
        "desktop_6" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 6'";
        "modo_tele" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'modo-tele enable'";
        "modo_monitor" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'modo-tele disable'";
        "reboot_to_windows" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'reboot-to-windows'";
        "gamescope" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'start-gamescope-session'";
        "display_device_steamdeck" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17  'display-device -d steamdeck'";
        "display_device_pc_gambled" = "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17  'display-device -d pc-gambled'";
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