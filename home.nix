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
    zerotierone

    appimage-run

    firefox
    chromium
    polychromatic
    libreoffice
    spotify
    vlc
    scrcpy
    inkscape-with-extensions
    gimp-with-plugins
    qt6.qtwebsockets
    libsForQt5.kdenlive
    libportal-qt5
    obs-studio
    kdenlive
    #ffmpeg_6-full
    jellyfin-ffmpeg

    dbeaver
    android-studio
    vscode
    python3
    python311Packages.pip

    stremio
    (discord.override {
    withOpenASAR = true;
    withVencord = true;
    })
    bottles
    steam
    steam-run
    osu-lazer-bin
    prismlauncher
    r2modman
    wineWowPackages.waylandFull
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
