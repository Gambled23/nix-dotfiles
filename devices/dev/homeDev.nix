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
    ../../core/programs/alacritty.nix
    ../../core/programs/direnv.nix
    ../../core/programs/kitty/kitty.nix
    ../../core/programs/lsd.nix
    ../../core/programs/starship.nix
    ../../core/programs/zsh.nix
    ../../core/programs/firefox.nix
  ];

  home = {
    username = "dev";
    homeDirectory = "/home/dev";
  };
  
  home.packages = with pkgs; [ 
    # dev tools
    dbeaver
    vscode
    kitty
    docker
    git


    # messaging
    vesktop 

    # utils
    jellyfin-ffmpeg
    libreoffice
    autorandr # for multi monitor setups

    # extras
    bat # cat replacement
    # oh-my-zsh plugins
    thefuck # Magnificent app which corrects your previous console command
    zsh

    #php dev
    php83 
    php83Packages.composer
    nodejs_21
  ];

  programs.git = {
      enable = true;
      userName  = "Deneb";
      userEmail = "deneb.rivera0272@alumnos.udg.mx";
    };
}


