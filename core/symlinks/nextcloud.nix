{ config, pkgs, lib, ... }:

{
  
  system.userActivationScripts.linktosharedfolder.text = ''
    # Documentos personales
    if [[ ! -h "$HOME/Documents/Documentos personales" ]]; then
      ln -s "$HOME/Nextcloud/Documentos personales" "$HOME/Documents/Documentos personales"
    fi


    # Modular
    if [[ ! -h "$HOME/Documents/Modular" ]]; then
      ln -s "$HOME/Nextcloud/Modular" "$HOME/Documents/Modular"
    fi


    # Wallpapers
    if [[ ! -h "$HOME/Pictures/Wallpapers" ]]; then
      ln -s "$HOME/Nextcloud/Wakk" "$HOME/Pictures/Wallpapers"
    fi
  '';
}
