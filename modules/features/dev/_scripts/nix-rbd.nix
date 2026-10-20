{ pkgs }:

pkgs.writeShellScriptBin "nix-rbd" ''
  #!${pkgs.bash}/bin/bash

  set -e

  rebuild_mode="switch"

  if  [[ $1 = "-u" ]]; then
    rebuild_mode="boot"
  elif [[ $1 ]]; then
    rebuild_mode=$1
  fi

  on_error() {
    trap - ERR
    ${pkgs.libnotify}/bin/notify-send "nix-rbd" "Rebuild failed: $rebuild_mode" -u critical -a "NixOS" -i "${pkgs.pantheon.elementary-icon-theme}/share/icons/elementary/status/symbolic/process-error-symbolic.svg"
  }
  trap on_error ERR

  cd /etc/nixos/
  git pull

  git add --all

  if  [[ $1 = "-u" ]]; then
    sudo nix flake update
  fi

  nh os $rebuild_mode .

  git restore --staged modules/features/ricing/shells/noctalia/_Colors/nvf.nix modules/features/ricing/shells/noctalia/_Colors/spicetify.ini modules/features/ricing/shells/noctalia/_Colors/starship.toml
  git commit -m "nix-rbd $rebuild_mode from $(hostname)" || echo "No changes to commit"

  git push
  ${pkgs.libnotify}/bin/notify-send "nix-rbd" "Rebuild complete: $rebuild_mode" -a "NixOS"  -i "${pkgs.pantheon.elementary-icon-theme}/share/icons/elementary/status/symbolic/process-completed-symbolic.svg"

  if [[ $1 = "-u" ]]; then
    agc
    read -p "Press enter to reboot"
    reboot
  fi
''
