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
    username = "dev";
    homeDirectory = "/home/dev";
  };

  home.packages = with pkgs; [ 
    # dev tools
    dbeaver
    vscode
    kitty
    tmux
    lazygit

    # messaging
    vesktop 

    # utils
    jellyfin-ffmpeg
    libreoffice
    autorandr # for multi monitor setups

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
