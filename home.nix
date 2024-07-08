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
    whatsapp-for-linux
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

    # webbrowsers
    floorp
    kdePackages.plasma-browser-integration
    chromium

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
