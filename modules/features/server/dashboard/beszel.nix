{ self, inputs, ... }: {
  flake.nixosModules.beszel = { pkgs, ... }: {
    services.beszel = {
      agent = {
        enable = true;
        openFirewall = true;
        smartmon.enable = true;
      };

      hub = {
        enable = true;
        host = "0.0.0.0";
        port = 8077;
      };
    };

    networking.firewall = {
      allowedUDPPorts = [ 8077 ];
      allowedTCPPorts = [ 8077 ];
    };
  };
}
