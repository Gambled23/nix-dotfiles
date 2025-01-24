{ pkgs }:

pkgs.writeShellScriptBin "aps" ''
  #!${pkgs.bash}/bin/bash
  if [ $1 ]; then
    rebuild_mode=$1
  else
    rebuild_mode=switch
  fi

  cd /etc/nixos/
  git pull

  set -e
  sudo nixos-rebuild $rebuild_mode 

  git add .
  git commit -m "auto update $(date)"
  git push

  echo "Rebuild $rebuild_mode complete"
''
