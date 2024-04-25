{ pkgs }:

pkgs.writeShellScriptBin "apll" ''
  #!${pkgs.bash}/bin/bash
 
  cd /home/gambled/Documents/nix-dotfiles/
  git pull
  sudo rm -r /etc/nixos/*
  sudo cp -r * /etc/nixos/
  
  sudo nixos-rebuild switch
  echo "Sistema restaurado UwU" | ${pkgs.clolcat}/bin/clolcat
''