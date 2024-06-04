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
    chromium
    dbeaver-bin
    vscode
    kitty
    tmux
    lazygit

    # dev languages
    #kotlin
    #zulu #java

    # neovim
    #python311Packages.pynvim
    #xclip # allows using the clipboard inside a terminal 

    # media
    stremio
    vlc

    # media creation
    gimp

    # messaging
    vesktop 

    # networking
    zerotierone

    # utils
    jellyfin-ffmpeg
    android-tools
    libreoffice
    #gnome.simple-scan
    galaxy-buds-client
    autorandr # for multi monitor setups
    nextcloud-client

    # extras
    bat # cat replacement
    #glances # htop replacement
    #neofetch
    lxde.lxsession
    # oh-my-zsh plugins
    #thefuck # Magnificent app which corrects your previous console command
    zsh
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
