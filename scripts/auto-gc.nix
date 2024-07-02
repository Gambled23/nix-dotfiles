{ pkgs }:

pkgs.writeShellScriptBin "agc" ''
  #!${pkgs.bash}/bin/bash

  sudo nix-collect-garbage  --delete-old
  nix-env --delete-generations old
  sudo nix-collect-garbage -d
  nix store optimise

  echo "Sistema borrado" | ${pkgs.clolcat}/bin/clolcat

  cd /home/gambled/Pictures/Screenshots/
  rm *
  echo "Screenshots borradas" | ${pkgs.clolcat}/bin/clolcat
  sudo rm -rf /home/gambled/.cache/
  echo "Cache borrada" | ${pkgs.clolcat}/bin/clolcat
''