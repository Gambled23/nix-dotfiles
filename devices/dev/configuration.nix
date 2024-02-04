{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "23.11";
  networking.hostName = "dev-gambled";

  imports =
    [ 
      ./hardware-configuration.nix
    ];

}
