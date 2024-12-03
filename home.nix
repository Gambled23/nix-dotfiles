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

    #* dev tools
    ventoy-full
    firefox-unwrapped
    dbeaver-bin
    vscode
    zed-editor
    tmux
    lazygit   
    fzf
    warp-terminal

    #* dev languages
    #kotlin
    #zulu #java

    #* media
    miru
    stremio
    vlc
    spotify

    #* media creation
    gimp
    inkscape-with-extensions
    qt6.qtwebsockets
    libportal-qt5
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        droidcam-obs
      ];
    })

    #* messaging
    #vesktop 
    zapzap

    #* networking
    zerotierone

    #* utils
    unrar
    p3x-onenote
    protontricks
    galaxy-buds-client
    jellyfin-ffmpeg
    android-tools
    libreoffice
    scrcpy
    nextcloud-client
    ticktick
    #gnome.simple-scan
    #logseq
    #rquickshare

    #* webbrowsers   
    google-chrome  
    #floorp
    #chromium

    #* extras
    bat
    lxde.lxsession
    neofetch
    zsh

    #* algoritmos
    weka
    python312Packages.orange3

    #* guitarra
    guitarix
    carla
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
