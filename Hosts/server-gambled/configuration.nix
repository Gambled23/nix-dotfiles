{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "26.11";
  networking.hostName = "server-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Core/configuration.nix
    ../../Machines/Server/configuration.nix

    ../../Features/Gaming/glances.nix

    ../../Features/Server/code-server.nix
    ../../Features/Server/homeassistant.nix
    ../../Features/Server/homepage-dashboard.nix
    ../../Features/Server/paperless.nix
    ../../Features/Server/nginx.nix

    # bootloader
    ../../Features/Boot/grub.nix
  ];

  programs.nix-ld.enable = true; # for vscode remote server

  nix.settings = {
    max-jobs = 1;
    cores = 2;
  };
}
