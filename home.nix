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
    core/programs/kitty/kitty.nix
    core/programs/lsd.nix
    core/programs/neovim.nix
    core/programs/starship.nix
    core/programs/zsh.nix
    core/programs/firefox.nix
    # i3
    #core/services/xserver/i3/config.nix
  ];

  home = {
    username = "gambled";
    homeDirectory = "/home/gambled";
  };

  home.packages = with pkgs; [ 
    # dev tools
    dbeaver
    vscode
    kitty
    tmux
    lazygit
    deepin.deepin-picker

    # dev languages
    kotlin
    zulu #java
    gcc
    rustc
    rustup

    # neovim
    #python311Packages.pynvim
    xclip # allows using the clipboard inside a terminal 

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
    gnome.simple-scan
    galaxy-buds-client
    autorandr # for multi monitor setups
    nextcloud-client

    # extras
    bat # cat replacement
    glances # htop replacement
    neofetch
    lxde.lxsession
    # oh-my-zsh plugins
    thefuck # Magnificent app which corrects your previous console command
    zsh
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
