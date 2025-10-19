{ pkgs }:

pkgs.writeShellScriptBin "nix-rbd" ''
  #!${pkgs.bash}/bin/bash

  device="pc-gambled"

  # Parse options
  while getopts "u" opt; do
    case $opt in
      u)
        update_config=true
        ;;
      h)
        echo "Usage: nix-rbd [-u] [rebuild_mode]"
        echo "  -u                Update configuration before rebuilding"
        echo "  rebuild_mode     One of 'switch', 'boot', 'test', or 'build'"
        exit 0
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

  git add .
  sudo nixos-rebuild $rebuild_mode
  git commit -m "auto-update $(date)"
  git push
  echo "Rebuild $rebuild_mode complete"

  if [ "$update_config" = true ]; then
    agc
    read -p "Press enter to reboot"
    reboot
  fi
''
