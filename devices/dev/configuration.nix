{ config, pkgs, lib, inputs, outputs, ... }:

{
  networking.hostName = "dev-gambled";

  imports =
    [ 
      ./hardware-configuration.nix
    ];

}
