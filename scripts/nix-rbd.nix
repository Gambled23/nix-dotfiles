{ pkgs }:

pkgs.writeShellScriptBin "nix-rbd" ''
  #!${pkgs.bash}/bin/bash

  set -e
  cd /etc/nixos/
  git pull

  git add .

  rebuild_mode="switch"

  if  [[ $1 = "-u" ]]; then
    sudo nix flake update
    rebuild_mode="boot"
  elif [[ $1 ]]; then
    rebuild_mode=$1
  fi

  sudo nixos-rebuild $rebuild_mode

  git commit -m "nix-rbd $rebuild_mode"

  git push
  echo "Rebuild $rebuild_mode complete"

  if [[ $1 = "-u" ]]; then
    agc
    read -p "Press enter to reboot"
    reboot
  fi

''
