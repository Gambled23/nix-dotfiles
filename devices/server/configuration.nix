{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "25.05";
  networking.hostName = "server-gambled";

  imports = [
    ./hardware-configuration.nix

    ../../configuration.nix
    ../../core/services/code-server.nix
    # ../../core/services/docker.nix
    ../../core/services/homeassistant.nix
    # ../../core/services/tandoor.nix
    #./symlinks.nix

    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];

  environment.systemPackages = with pkgs; [
  ];
  programs.nix-ld.enable = true; # for vscode remote server
}
