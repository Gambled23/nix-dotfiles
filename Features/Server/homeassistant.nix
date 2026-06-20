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
    customLovelaceModules = with pkgs; [
      (callPackage ../../Pkgs/material-components/package.nix {})
      home-assistant-custom-lovelace-modules.auto-entities
      home-assistant-custom-lovelace-modules.button-card
      home-assistant-custom-lovelace-modules.bubble-card
      home-assistant-custom-lovelace-modules.card-mod
      home-assistant-custom-lovelace-modules.mushroom
      home-assistant-custom-lovelace-modules.navbar-card
      home-assistant-custom-lovelace-modules.material-you-utilities
      (callPackage ../../Pkgs/swipe-card/package.nix {})
      home-assistant-custom-lovelace-modules.xiaomi-vacuum-map-card
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

      recorder.db_url = "postgresql://@/hass";

      shell_command = builtins.mapAttrs (name: cmd: "${ssh_command}${cmd}") {
        "suspend_pc" = "'sudo systemctl start systemd-suspend'";
        "hibernate_pc" = "'sudo systemctl hibernate'";
        "reboot_pc" = "'sudo systemctl reboot'";
        "poweroff_pc" = "'sudo systemctl poweroff'";
        "desktop_1" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 1 })\"'";
        "desktop_2" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 2 })\"'";
        "desktop_3" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 3 })\"'";
        "desktop_4" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 4 })\"'";
        "desktop_5" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 5 })\"'";
        "desktop_6" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 6 })\"'";
        "desktop_7" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 7 })\"'";
        "desktop_8" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 8 })\"'";
        "desktop_9" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 9 })\"'";
        "desktop_10" = "'hyprctl dispatch \"hl.dsp.focus({ workspace = 10 })\"'";
        "reboot_to_windows" = "'reboot-to-windows'";
        "display_device_steamdeck" = "'display-device -d steamdeck'";
        "display_device_pc_gambled" = "'display-device -d pc-gambled'";
        "display_device_dev_gambled" = "'display-device -d dev-gambled'";
        "display_device_tv" = "'display-device -d tv'";
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
