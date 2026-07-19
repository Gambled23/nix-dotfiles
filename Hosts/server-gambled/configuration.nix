{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "26.11";
  networking.hostName = "server-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Server/configuration.nix

    ../../Features/Gaming/glances.nix

    ../../Features/Server/code-server.nix
    ../../Features/Server/homeassistant.nix
    ../../Features/Server/homepage-dashboard.nix
    ../../Features/Server/paperless.nix
    # ../../Features/Server/onlyoffice.nix
    ../../Features/Server/nginx.nix
    ../../Features/Server/Network/pi-hole.nix


    # bootloader
    ../../Features/Boot/grub.nix
  ];

  nix.settings = {
    max-jobs = 1;
    cores = 2;
  };
}
