{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    inputs.nix-crab.nixosModules.default
  ];

  programs.nix-crab = {
    # downgrade.enable = true;
    cloudredirect.enable = true;
    cloudredirect.moon.enable = true;
    millennium.enable = true;
    slssteam.enable = true;
    slssteam-moon.enable = true;
  };
}
