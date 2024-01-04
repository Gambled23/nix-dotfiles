# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
  ];
  
  home = {
    username = "gambled";
    homeDirectory = "/home/gambled";
  };

  home.packages = with pkgs; [ 
    # networking
    zerotierone

    # apps
    firefox
    chromium
    libreoffice
    gimp-with-plugins

    # media
    spotify
    vlc
    #qt6.qtwebsockets
    #libportal-qt5
    #ffmpeg_6-full
    #jellyfin-ffmpeg

    # dev
    dbeaver
    vscode
    php
    nodejs_21
    lazygit

    poppler_utils

    # chat 
    (discord.override {
    withOpenASAR = true;
    withVencord = true;
    })
    whatsapp-for-linux
  ];
  programs = {
    git = {
    enable = true;
    userName = "Gambled23";
    userEmail = "ipog71@gmail.com";
    };
  };
  


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
