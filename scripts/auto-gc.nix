{ pkgs }:

pkgs.writeShellScriptBin "auto-gc" ''
  #!${pkgs.bash}/bin/bash

  sudo nix-collect-garbage  --delete-old
  sudo /run/current-system/bin/switch-to-configuration boot

  echo "Sistema borrado" | ${pkgs.lolcat}/bin/lolcat

  cd /home/$(whoami)/Pictures
  rm Screenshot*
  echo "Screenshots borradas" | ${pkgs.lolcat}/bin/lolcat
''