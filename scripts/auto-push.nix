{ pkgs }:

pkgs.writeShellScriptBin "aps" ''
  #!${pkgs.bash}/bin/bash
  if [ $1 ]; then
    rebuild_mode=$1
  else
    rebuild_mode=switch
  fi

  
  set -e
  cd /home/gambled/Documents
  if [ -d nix-dotfiles ]; then
    cd nix-dotfiles
  else
    git clone git@github.com:Gambled23/nix-dotfiles.git
    cd nix-dotfiles
  fi
  
  sudo nixos-rebuild $rebuild_mode 
  
  sudo rm -r *
  cp -r /etc/nixos/* /home/gambled/Documents/nix-dotfiles/
  git add .
  git commit -m "auto update $(date)"
  git push
  echo "Rebuild {rebuild_mode} complete"
''
