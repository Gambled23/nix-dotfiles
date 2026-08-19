{ self, inputs, ... }: {
  flake.nixosModules.codeServer = { config, pkgs, lib, ... }: {
    services.code-server = {
      enable = true;
      host = "0.0.0.0";
      auth = "none";
    };
    networking.firewall.allowedTCPPorts = [
      config.services.code-server.port
      4444
    ];
  };
}
