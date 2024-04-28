{ config, pkgs, lib, ... }:

{
  
  system.userActivationScripts.linktosharedfolder.text = ''
    # Documentos personales
    if [[ ! -h "$HOME/Documents/Documentos personales" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/Documentos personales" "$HOME/Documents/Documentos personales"
    fi


    # Modular
    if [[ ! -h "$HOME/Documents/Modular" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/" "$HOME/Documents/Modular"
    fi


    # Wallpapers
    if [[ ! -h "$HOME/Pictures/Wallpapers" ]]; then
      ln -s "/hdd/home/gambled/Nextcloud/Wallpapers" "$HOME/Pictures/Wallpapers"
    fi
  '';
}
