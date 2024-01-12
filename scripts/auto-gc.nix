{ pkgs }:

pkgs.writeShellScriptBin "auto-gc" ''
  #!${pkgs.bash}/bin/bash

  sudo nix-collect-garbage  --delete-old
  nix-env --delete-generations old
  sudo nix-collect-garbage -d
  nix store optimise

  echo "Sistema borrado" | ${pkgs.lolcat}/bin/lolcat

  cd /home/$(whoami)/Pictures
  rm Screenshot*
  echo "Screenshots borradas" | ${pkgs.lolcat}/bin/lolcat
''