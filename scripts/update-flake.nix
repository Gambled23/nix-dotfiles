{ pkgs }:

pkgs.writeShellScriptBin "update-flake" ''
  #!${pkgs.bash}/bin/bash
  set -e

  cd /etc/nixos/
  mv flake.lock flakeold.lock
  nix-rbd boot
  
  reboot
''