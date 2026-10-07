{ self, inputs, ... }: {
  flake.nixosModules.omnibin = { config, pkgs, lib, ... }: {
    imports = [ inputs.omnibin.nixosModules.default ];
    services.omnibin.enable = true;
  };
}
