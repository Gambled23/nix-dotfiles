{ pkgs }:

pkgs.writeShellScriptBin "nix-rbd" ''
  #!${pkgs.bash}/bin/bash

  set -e

  rebuild_mode=""
  do_update=false
  do_sync=false

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -u|--update)
        do_update=true
        shift
        ;;
      -s|--sync)
        do_sync=true
        shift
        ;;
      -*)
        echo "Unknown option: $1" >&2
        exit 1
        ;;
      *)
        rebuild_mode="$1"
        shift
        ;;
    esac
  done

  if [[ -z "$rebuild_mode" ]]; then
    if [[ "$do_update" = true ]]; then
      rebuild_mode="boot"
    else
      rebuild_mode="switch"
    fi
  fi

  on_error() {
    trap - ERR
    ${pkgs.libnotify}/bin/notify-send "nix-rbd" "Rebuild failed: $rebuild_mode" -u critical -a "NixOS" -i "${pkgs.pantheon.elementary-icon-theme}/share/icons/elementary/status/symbolic/process-error-symbolic.svg"
  }
  trap on_error ERR

  cd /etc/nixos/
  git pull

  git add --all

  if [[ "$do_update" = true ]]; then
    sudo nix flake update
  fi

  nh os $rebuild_mode .

  if [[ "$do_sync" = true ]]; then
    git restore --staged modules/features/ricing/shells/noctalia/_Colors/nvf.nix modules/features/ricing/shells/noctalia/_Colors/spicetify.ini modules/features/ricing/shells/noctalia/_Colors/starship.toml
    git commit -m "nix-rbd $rebuild_mode from $(hostname)" || echo "No changes to commit"
    git push
  fi

  ${pkgs.libnotify}/bin/notify-send "nix-rbd" "Rebuild complete: $rebuild_mode" -a "NixOS"  -i "${pkgs.pantheon.elementary-icon-theme}/share/icons/elementary/status/symbolic/process-completed-symbolic.svg"

  if [[ "$do_update" = true ]]; then
    agc
    read -p "Press enter to reboot"
    reboot
  fi
''
