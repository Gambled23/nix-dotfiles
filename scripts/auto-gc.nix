{ pkgs }:

pkgs.writeShellScriptBin "agc" ''
  #!${pkgs.bash}/bin/bash

  sudo nix-collect-garbage  --delete-old
  nix-env --delete-generations old
  sudo nix-collect-garbage -d
  nix store optimise

  cd /home/gambled/Pictures/Screenshots/
  sudo rm *
  sudo rm -rf /home/gambled/.cache/

  echo "Sistema limpiado" | ${pkgs.clolcat}/bin/clolcat
''