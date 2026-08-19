{ self, inputs, ... }: {
  flake.nixosModules.mariadb = { pkgs, ... }: {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
