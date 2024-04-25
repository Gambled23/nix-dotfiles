{ pkgs }:

pkgs.writeShellScriptBin "aps-full" ''
  #!${pkgs.bash}/bin/bash
  set -e
  cd /home/gambled/Documents
  if [ -d nix-dotfiles ]; then
    cd nix-dotfiles
  else
    git clone git@github.com:Gambled23/nix-dotfiles.git
    cd nix-dotfiles
  fi

  nix run github:mcdonc/plasma-manager/enable-look-and-feel-settings > config.nix
  sudo mv config.nix /etc/nixos/core/services/xserver/kde/config.nix
  sudo nixos-rebuild switch 
  
  sudo rm -r *
  cp -r /etc/nixos/* /home/gambled/Documents/nix-dotfiles/
  git add .
  git commit -m "auto update $(date)"
  git push
  echo "Sistema respaldado! n.n" | ${pkgs.lolcat}/bin/lolcat
''
