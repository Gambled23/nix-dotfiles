{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "23.11";
  networking.hostName = "laptop-gambled";

  imports = [ 
    ../../configuration.nix
    ./hardware-configuration.nix
    ./symlinks.nix

    ../../core/programs/steam.nix
  ];
}
