{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: 
{
  imports = [

    # i3
    #core/services/xserver/i3/config.nix
  ];
  home.packages = with pkgs; [ 
    inputs.nix-software-center.packages.${system}.nix-software-center
    inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    # dev tools
    dbeaver-bin
    vscode
    warp-terminal
    tmux
    lazygit

    # dev languages
    #kotlin
    #zulu #java

    # media
    miru
    stremio
    vlc

    # media creation
    gimp
    inkscape-with-extensions
    qt6.qtwebsockets
    libportal-qt5
    obs-studio
    jellyfin-ffmpeg

    # messaging
    vesktop 
    #whatsapp-for-linux
    zapzap
    #telegram-desktop

    # networking
    zerotierone

    # utils
    jellyfin-ffmpeg
    unrar
    android-tools
    libreoffice
    scrcpy
    #gnome.simple-scan
    galaxy-buds-client
    autorandr # for multi monitor setups
    nextcloud-client
    #rquickshare
    # webbrowsers
    #floorp
    google-chrome
    kdePackages.plasma-browser-integration
    #chromium

    # extras
    bat
    lxde.lxsession

    # oh-my-zsh plugins
    zsh
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
