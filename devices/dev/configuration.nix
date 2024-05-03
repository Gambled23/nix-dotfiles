{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "23.11";
  networking.hostName = "dev-gambled";

  imports = [ 
    ../../configuration.nix
    ./hardware-configuration.nix
    ./symlinks.nix
  ];
}
