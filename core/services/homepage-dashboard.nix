{ config, pkgs, lib, ... }:

{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8082;
    allowedHosts = [ "*" ];

    services = [
      {
        "Dev" = [
          {
            "Homeassistant" = {
              href = "http://localhost/8123";
            };
          }
          {
            "Syncthing" = {
              href = "http://localhost/8384";
            };
          }
          {
            "Code server" = {
              href = "http://0.0.0.0/4444";
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
