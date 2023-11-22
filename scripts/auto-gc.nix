{ pkgs }:

pkgs.writeShellScriptBin "auto-update-nixos" ''
  #!${pkgs.bash}/bin/bash
  sudo nixos-rebuild switch 
  
  sudo cp -r /etc/nixos/* /home/gambled/Documents/nix-dotfiles/
  cd /home/gambled/Documents/nix-dotfiles/
  sudo git add .
  sudo git commit -m "auto update $(date)"
  git push
  echo "Sistema respaldado! n.n" | ${pkgs.lolcat}/bin/lolcat
''
