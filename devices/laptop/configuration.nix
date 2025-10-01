{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "25.05";
  networking.hostName = "laptop-gambled";

  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
    #./symlinks.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];
}
