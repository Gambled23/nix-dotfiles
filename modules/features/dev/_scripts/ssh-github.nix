{ pkgs }:

pkgs.writeShellScriptBin "ssh-github" ''
  #!${pkgs.bash}/bin/bash

  ssh-keygen -t ed25519 -C "ipog71@gmail.com"
  eval "$(ssh-agent -s)"
  
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  pbcopy < ~/.ssh/id_ed25519.pub
  ${pkgs.gum}/bin/gum style --align center --width 50 --margin "1" --padding "1" "¡Clave pública copiada al portapapeles!"
''
