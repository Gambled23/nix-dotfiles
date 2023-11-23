{ pkgs }:

pkgs.writeShellScriptBin "auto-push" ''
  #!${pkgs.bash}/bin/bash
  set -e
  sudo nixos-rebuild switch 
  
  sudo cp -r /etc/nixos/* /home/gambled/Documents/nix-dotfiles/
  cd /home/gambled/Documents/nix-dotfiles/
  sudo git add .
  sudo git commit -m "auto update $(date)"
  git push
  echo "Sistema respaldado! n.n" | ${pkgs.lolcat}/bin/lolcat
''