{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  imports = [
    ../../home.nix
    ../../core/programs/alacritty.nix
    ../../core/programs/direnv.nix
    ../../core/programs/git.nix
    ../../core/programs/kitty/kitty.nix
    ../../core/programs/lsd.nix
    ../../core/programs/neovim.nix
    ../../core/programs/starship.nix
    ../../core/programs/zsh.nix
    ../../core/programs/firefox.nix
  ];
  
  home.packages = with pkgs; [ 
    # books
    #hakuneko
    #kcc
    #calibre
    #mangal

    # dev tools
    #android-studio
    #cmake
    
    #dev languages

    # games
    #gamemode
    ryujinx
    steam
    steam-run
    osu-lazer-bin
    #prismlauncher #minecra
    r2modman
    wineWowPackages.waylandFull
    
    # media
    scrcpy
    # media creation
    inkscape-with-extensions
    qt6.qtwebsockets
    libsForQt5.kdenlive
    libportal-qt5
    obs-studio
    kdenlive
    jellyfin-ffmpeg

    # messaging 
    whatsapp-for-linux
    telegram-desktop

    # utils
    polychromatic

    #web browsers
    #chromium
  ];
}


