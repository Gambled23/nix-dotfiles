{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.home-assistant = {
    enable = true;
    extraPackages = ps: with ps; [ psycopg2 ];
    openFirewall = true;
    extraComponents = [
      # Components required to complete the onboarding
      "analytics"
      # "cast"
      "glances"
      "google_translate"
      "met"
      "radio_browser"
      "roborock"
      "shopping_list"
      "spotify"
      "tuya"
      "upnp"
      "isal"
      "wake_on_lan"
    ];
    # config = null;
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {

      };
      recorder.db_url = "postgresql://@/hass";
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