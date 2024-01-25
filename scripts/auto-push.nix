{ pkgs }:

pkgs.writeShellScriptBin "auto-push" ''
  #!${pkgs.bash}/bin/bash
  set -e
  sudo nixos-rebuild switch 
  
  cd /home/gambled/Documents/nix-dotfiles/
  sudo rm -r *
  cp -r /etc/nixos/* /home/gambled/Documents/nix-dotfiles/
  git add .
  git commit -m "auto update $(date)"
  git push
  echo "Sistema respaldado! n.n" | ${pkgs.lolcat}/bin/lolcat
''
