{ self, inputs, ... }: {
  flake.nixosModules.glances = { pkgs, ... }: {
    services.glances = {
      enable = true;
      openFirewall = true;
    };
  };
}
