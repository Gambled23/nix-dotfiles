{ pkgs }:

pkgs.writeShellScriptBin "agc" ''
  #!${pkgs.bash}/bin/bash

  sudo nix-collect-garbage  --delete-old
  nix-env --delete-generations old
  sudo nix-collect-garbage -d
  nix store optimise

  echo "Sistema borrado" | ${pkgs.clolcat}/bin/clolcat

  cd /home/$(whoami)/Pictures
  rm Screenshots/*
  echo "Screenshots borradas" | ${pkgs.clolcat}/bin/clolcat
''