{ pkgs }:

pkgs.writeShellScriptBin "apll" ''
  #!${pkgs.bash}/bin/bash
  if [ $1 ]; then
    rebuild_mode=$1
  else
    rebuild_mode=switch
  fi

  cd /etc/nixos/
  git pull

  sudo nixos-rebuild $rebuild_mode
  echo "Sistema restaurado UwU" | ${pkgs.clolcat}/bin/clolcat
''