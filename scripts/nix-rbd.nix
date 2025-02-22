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

  if [ $1 ]; then
    rebuild_mode=$1
  fi

  if [ "$update_config" = true ]; then
    sudo nix flake update
    rebuild_mode="boot"
  fi

  # Get rebuild mode from first remaining argument

  sudo nixos-rebuild $rebuild_mode
  git add .
  git commit -m "Update configuration"
  git push
  echo "Rebuild $rebuild_mode complete"

  if [ "$update_config" = true ]; then
    agc
    read -p "Press enter to reboot"
    reboot
  fi
''
