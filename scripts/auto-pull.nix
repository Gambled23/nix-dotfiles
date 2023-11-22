{ pkgs }:

pkgs.writeShellScriptBin "auto-pull" ''
  #!${pkgs.bash}/bin/bash
 
  cd /home/gambled/Documents/nix-dotfiles/
  git pull
  sudo cp -r * /etc/nixos/
  sudo nixos-rebuild switch
  echo "Sistema restaurado UwU" | ${pkgs.lolcat}/bin/lolcat
''