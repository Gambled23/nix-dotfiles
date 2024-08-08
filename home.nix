{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: 
{
  imports = [
    core/programs/alacritty.nix
    core/programs/direnv.nix
    core/programs/git.nix
    #core/programs/kitty/kitty.nix
    core/programs/lsd.nix
    #core/programs/neovim.nix
    core/programs/starship.nix
    core/programs/zsh.nix
    #core/programs/firefox.nix
  ];
  home.packages = with pkgs; [ 
    inputs.nix-software-center.packages.${system}.nix-software-center
    #inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    # dev tools
    dbeaver-bin
    vscode
    #warp-terminal
    tmux
    lazygit

    # dev languages
    #kotlin
    #zulu #java

    # media
    miru
    stremio
    vlc
    spotify

    # media creation
    gimp
    inkscape-with-extensions
    qt6.qtwebsockets
    libportal-qt5
    obs-studio

    # messaging
    vesktop 
    zapzap

    # networking
    zerotierone

    # utils
    jellyfin-ffmpeg
    android-tools
    libreoffice
    scrcpy
    #gnome.simple-scan
    nextcloud-client
    #rquickshare
    # webbrowsers
    #floorp
    google-chrome
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
