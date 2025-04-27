{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    #core/programs/alacritty.nix
    core/programs/direnv.nix
    core/programs/git.nix
    #core/programs/kitty/kitty.nix
    core/programs/lsd.nix
    #core/programs/neovim.nix
    core/programs/starship.nix
    core/programs/zsh.nix
    core/programs/firefox.nix
  ];
  home.packages = with pkgs; [

    #* dev tools
    dbeaver-bin
    vscode
    lazygit
    fzf

    #* media
    miru
    stremio
    vlc

    #* media creation
    gimp
    inkscape-with-extensions
    obs-studio

    #* messaging
    whatsapp-for-linux
    materialgram

    #* networking
    zerotierone

    #* utils
    p3x-onenote
    protontricks
    #galaxy-buds-client
    #jellyfin-ffmpeg
    android-tools
    libreoffice
    scrcpy
    nextcloud-client
    zoom-us
    koreader
    #logseq

    #* webbrowsers
    #google-chrome
    #floorp
    #chromium

    #* extras
    bat
    lxde.lxsession
    neofetch
    zsh

    #* guitarra
    guitarix
    carla
    gxplugins-lv2
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
