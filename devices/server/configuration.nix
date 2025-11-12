{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "25.05";
  networking.hostName = "server-gambled";

  imports = [
    ../../configuration.nix
    ../../core/services/docker.nix
    ../../core/services/homeassistant.nix
    ./hardware-configuration.nix
    #./symlinks.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];
}
