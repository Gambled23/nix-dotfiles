{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.home-assistant = {
    enable = true;
    extraPackages = ps: with ps; [ psycopg2 ];
    # openFirewall = true;
    extraComponents = [
      "analytics"
      "backup"
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
      "script ui" = "!include scripts.yaml";
      # These can be mixed with declarative configurations
      # "automation nixos" = [
        # YAML automations go here
      # ];

      lovelace.mode = "storage";
      recorder.db_url = "postgresql://@/hass";
    };

    configWritable = true;
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