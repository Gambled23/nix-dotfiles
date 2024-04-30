{ config, pkgs, lib, inputs, outputs, ... }:

{
  system.stateVersion = "23.11";
  networking.hostName = "dev-gambled";

  imports = [ 
    ../../configuration.nix
    ./hardware-configuration.nix
  ];

    system.userActivationScripts.linktosharedfolder.text = ''
    # Documentos personales
    if [[ ! -h "$HOME/Documents/Documentos personales" ]]; then
      ln -s "/Documentos/Nextcloud/Documentos personales" "$HOME/Documents/Documentos personales"
    fi

    # Modular
    if [[ ! -h "$HOME/Documents/Modular" ]]; then
      ln -s "/Documentos/Nextcloud/Modular" "$HOME/Documents/Modular"
    fi

    # Wallpapers
    if [[ ! -h "$HOME/Pictures/Wallpapers" ]]; then
      ln -s "/Documentos/Nextcloud/Wallpapers" "$HOME/Pictures/Wallpapers"
    fi

    # Codes
    if [[ ! -h "$HOME/Codes" ]]; then
      ln -s "/Documentos/Codes/" "$HOME/Codes"
    fi

    # Documents
    if [[ ! -h "$HOME/Documents" ]]; then
      ln -s "/Documentos/Documents/" "$HOME/Documents"
    fi

    # Downloads
    if [[ ! -h "$HOME/Downloads" ]]; then
      ln -s "/Documentos/Downloads/" "$HOME/Downloads"
    fi

    # Music
    if [[ ! -h "$HOME/Music" ]]; then
      ln -s "/Documentos/Music/" "$HOME/Music"
    fi

    # Nextcloud
    if [[ ! -h "$HOME/Nextcloud" ]]; then
      ln -s "/Documentos/Nextcloud/" "$HOME/Nextcloud"
    fi

    # Pictures
    if [[ ! -h "$HOME/Pictures" ]]; then
      ln -s "/Documentos/Pictures/" "$HOME/Pictures"
    fi

    # Videos
    if [[ ! -h "$HOME/Videos" ]]; then
      ln -s "/Documentos/Videos/" "$HOME/Videos"
    fi
  '';
}
