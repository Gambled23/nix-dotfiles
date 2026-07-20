{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "26.11";
  networking.hostName = "server-gambled";

  imports = [
    ./hardware-configuration.nix
    ./symlinks.nix
    ../../Machines/Server/configuration.nix

    ../../Features/Gaming/glances.nix

    # ../../Features/Server/Dashboard/beszel.nix
    ../../Features/Server/Dashboard/homeassistant.nix
    ../../Features/Server/Dashboard/homepage-dashboard.nix
    ../../Features/Server/Tools/code-server.nix
    ../../Features/Server/Tools/paperless.nix
    ../../Features/Server/Network/nginx.nix
    ../../Features/Server/Network/pi-hole.nix


    # bootloader
    ../../Features/Boot/grub.nix
  ];

  networking.networkmanager = {
    insertNameservers = [ 
      "192.168.1.27"
      "1.1.1.1"
      "8.8.8.8" 
    ];
  };

  nix.settings = {
    max-jobs = 1;
    cores = 2;
  };
}
