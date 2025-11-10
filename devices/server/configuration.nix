{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "25.05";
  networking.hostName = "server-gambled";

  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
    ../../core/services/homeassistant.nix
    #./symlinks.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];
}
