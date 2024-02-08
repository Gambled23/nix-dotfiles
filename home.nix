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
    core/programs/kitty.nix
    core/programs/lsd.nix
    core/programs/neovim.nix
    core/programs/starship.nix
    core/programs/zsh.nix
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
    cmake

    # dev languages
    python3
    python311Packages.pip
    php83Packages.composer
    php83
    nodejs_21

    # neovim
    python311Packages.pynvim
    xclip # allows using the clipboard inside a terminal 

    # media
    vlc
    scrcpy
    stremio
    # media creation
    gimp-with-plugins

    # messaging
    vesktop # discord wayland screenshare
    whatsapp-for-linux
    telegram-desktop

    # networking
    zerotierone

    # utils
    jellyfin-ffmpeg
    android-tools
    appimage-run
    libreoffice
    xwaylandvideobridge
    libsForQt5.polonium

    # web browsers
    firefox
    chromium

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
