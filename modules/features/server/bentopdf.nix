{ self, inputs, ... }: {
  flake.nixosModules.bentopdf = { pkgs, ... }: {
    services.bentopdf = {
      enable = true;
      domain = "_";
    };
  };
}
