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
    firefox-unwrapped
    dbeaver-bin
    vscode
    tmux
    lazygit   
    fzf

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
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        droidcam-obs
      ];
    })

    # messaging
    vesktop 
    zapzap

    # networking
    zerotierone

    # utils
    unrar
    p3x-onenote
    protontricks
    #logseq
    jellyfin-ffmpeg
    android-tools
    libreoffice
    scrcpy
    #gnome.simple-scan
    nextcloud-client
    #rquickshare
    ticktick

    # webbrowsers     
    #floorp
    google-chrome
    #chromium

    # extras
    bat
    lxde.lxsession
    neofetch
    
    # oh-my-zsh plugins
    zsh

    #wine
    wine64
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
