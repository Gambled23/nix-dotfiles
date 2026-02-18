{ pkgs }:

pkgs.writeShellScriptBin "agc" ''
  #!${pkgs.bash}/bin/bash
  sudo nix-collect-garbage --delete-older-than 2d --cores 16 && nix-collect-garbage --delete-older-than 2d --cores 16
  nix store gc && sudo nix store optimise
  sudo nix profile wipe-history

  sudo rm /home/gambled/Pictures/Screenshots/*
  sudo rm -rf /home/gambled/.cache/

  echo "Sistema limpiado" | ${pkgs.clolcat}/bin/clolcat
''