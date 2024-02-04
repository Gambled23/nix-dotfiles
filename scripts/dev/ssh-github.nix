{ pkgs }:

pkgs.writeShellScriptBin "dev_ssh-github" ''
  #!${pkgs.bash}/bin/bash
  ssh-keygen -t ed25519 -C "ipog71@gmail.com"
  eval "$(ssh-agent -s)"
  
  ssh-add ~/.ssh/id_ed25519
  echo "Copie la siguiente clave para agregarla a github" | ${pkgs.lolcat}/bin/lolcat
  cat ~/.ssh/id_ed25519.pub 
''


