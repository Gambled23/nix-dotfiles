{ pkgs }:

pkgs.writeShellScriptBin "update-flake" ''
  #!${pkgs.bash}/bin/bash
  set -e

  cd /etc/nixos/
  mv flake.nix flakeold.nix
  nix-rbd boot
  
  reboot
''