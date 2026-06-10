{ pkgs }:

pkgs.writeShellScriptBin "nix-rbd" ''
  #!${pkgs.bash}/bin/bash

  set -e
  cd /etc/nixos/
  git pull

  git add --all
  git restore --staged Features/Ricing/noctalia_colors/nvf.nix Features/Ricing/noctalia_colors/spicetify.ini

  rebuild_mode="switch"

  if  [[ $1 = "-u" ]]; then
    sudo nix flake update
    rebuild_mode="boot"
  elif [[ $1 ]]; then
    rebuild_mode=$1
  fi

  nh os $rebuild_mode .

  git commit -m "nix-rbd $rebuild_mode from $(hostname)" || echo "No changes to commit"

  git push
  ${pkgs.libnotify}/bin/notify-send "nix-rbd" "Rebuild complete: $rebuild_mode"

  if [[ $1 = "-u" ]]; then
    agc
    read -p "Press enter to reboot"
    reboot
  fi

''
