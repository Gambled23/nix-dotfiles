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

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    kate


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
    davinci-resolve

    dbeaver
    git
    vscode
    python3
    php82
    php82Packages.composer
    nodejs_20

    discord
    steam
    steam-run
    lutris
    wineWowPackages.waylandFull
  ];

  # Enable git
  programs.git = {
    enable = true;
    userName = "Gambled23";
    userEmail = "ipog71@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
