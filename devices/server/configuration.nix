{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "26.11";
  networking.hostName = "server-gambled";

  imports = [
    ./hardware-configuration.nix

    ../../configuration.nix
    ../../core/services/code-server.nix
    # ../../core/services/docker.nix
    ../../core/services/homeassistant.nix
    # ../../core/services/tandoor.nix
    #./symlinks.nix
    # ../../core/services/ollama.nix
    
    # bootloader
    #../../core/bootloader/systemd.nix
    ../../core/bootloader/grub.nix
  ];

  environment.systemPackages = with pkgs; [
    # openclaw
  ];
  nixpkgs.config.permittedInsecurePackages = [
    # "openclaw-2026.3.12"
  ];
  programs.nix-ld.enable = true; # for vscode remote server
}
