{ pkgs }:

pkgs.writeShellScriptBin "agc" ''
  #!${pkgs.bash}/bin/bash
  sudo nix-collect-garbage --delete-older-than 2d --cores 16 && nix-collect-garbage --delete-older-than 2d --cores 16
  home-manager expire-generations -d
  nix store gc && sudo nix store optimise
  sudo nix profile wipe-history
  home-manager remove-generations old
  

  sudo rm /home/gambled/Pictures/Screenshots/*
  sudo rm -rf /home/gambled/.cache/

  echo "Sistema limpiado" | ${pkgs.clolcat}/bin/clolcat
''