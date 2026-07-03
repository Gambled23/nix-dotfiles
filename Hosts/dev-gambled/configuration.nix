{ config, pkgs, lib, inputs, outputs, ... }:
{
  system.stateVersion = "26.11";
  networking.hostName = "dev-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Core/configuration.nix
    ../../Machines/Desktop/configuration.nix

    # ../../Features/Dev/ollama-client.nix
    ../../Features/Dev/docker.nix
    ../../Features/Tools/waydroid.nix
    # ../../Features/Dev/mariadb.nix

    # bootloader
    ../../Features/Boot/grub.nix
  ];

  nix.settings = {
    max-jobs = 3;
    cores = 4;
  };
}
