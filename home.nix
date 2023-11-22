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

    plasma-browser-integration
    firefox
    chromium
    polychromatic
    libreoffice
    spotify
    vlc
    waydroid
    wl-clipboard
    inkscape-with-extensions
    gimp-with-plugins
    libsForQt5.kdenlive
    libsForQt5.kaccounts-integration
    libsForQt5.kaccounts-providers
    libsForQt5.kio-gdrive
    libsForQt5.ktorrent
    libsForQt5.libktorrent
    kdenlive
    kate
    kup

    dbeaver
    vscode
    python3

    discord
    steam
    steam-run
    lutris
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
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
