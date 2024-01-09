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
    # dev
    dbeaver
    vscode
    tmux
    lazygit

    # networking
    zerotierone

    # utils
    android-tools
    appimage-run
    libreoffice

    # web browsers
    firefox
    chromium

    # media
    spotify
    vlc
    scrcpy
    
    # messaging
    (discord.override {
    withOpenASAR = true;
    withVencord = true;
    })
  ];

  programs = {
    git = {
    enable = true;
    userName = "Gambled23";
    userEmail = "ipog71@gmail.com";
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}