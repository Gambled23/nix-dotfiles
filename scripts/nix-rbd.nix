{ pkgs }:

pkgs.writeShellScriptBin "nix-rbd" ''
  #!${pkgs.bash}/bin/bash

  rebuild_mode="switch"
  update_config=false

  # Parse options
  while getopts "u" opt; do
    case $opt in
      u)
        update_config=true
        ;;
    esac
  done

  # Shift past the options
  shift $((OPTIND-1))
  cd /etc/nixos/
  git pull
  set -e

  if [ "$update_config" = true ]; then
    sudo nix flake update
    sudo nixos-rebuild boot
    agc
    read -p "Press enter to reboot"
    reboot
  fi

  # Get rebuild mode from first remaining argument
  if [ $1 ]; then
    rebuild_mode=$1
  fi

  sudo nixos-rebuild $rebuild_mode

  echo "Rebuild $rebuild_mode complete"
''
