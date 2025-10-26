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
    core/programs/lsd.nix
    #core/programs/neovim.nix
    core/programs/starship.nix
    core/programs/zsh.nix
    # core/programs/firefox.nix
    core/services/xserver/hyprland/config.nix
  ];
  home.packages = with pkgs; [
    #*books
    komikku

    #* dev tools
    dbeaver-bin
    vscode
    lazygit
    # fzf

    #* media
    # stremio
    vlc

    #* media creation
    gimp
    inkscape-with-extensions
    obs-studio

    #* messaging
    altus
    materialgram

    #* networking
    zerotierone

    #* utils
    # activitywatch
    # p3x-onenote
    # protontricks
    # galaxy-buds-client
    # jellyfin-ffmpeg
    android-tools
    libreoffice
    # rquickshare
    scrcpy
    nextcloud-client
    zoom-us
    # koreader
    #logseq

    #* webbrowsers
    google-chrome
    #floorp
    #chromium

    #* extras
    bat
    lxsession
    neofetch
    zsh

    #* guitarra
    guitarix
    tonelib-metal
    carla
    # gxplugins-lv2
  ];
  
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
