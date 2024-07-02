{ pkgs }:

pkgs.writeShellScriptBin "update-flake" ''
  #!${pkgs.bash}/bin/bash
  set -e

  cd /etc/nixos/
  sudo nix flake update
  aps boot
  
  agc
  reboot
''