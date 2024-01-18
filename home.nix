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
    core/programs/kitty.nix

    # i3
    core/services/xserver/i3/config.nix
  ];

  home = {
    username = "gambled";
    homeDirectory = "/home/gambled";
  };

  home.packages = with pkgs; [ 
    # dev
    dbeaver
    vscode
    kitty
    tmux
    lazygit

    # neovim
    python311Packages.pynvim
    xclip # allows using the clipboard inside a terminal 

    # media
    spotify
    vlc
    scrcpy
    
    # messaging
    (discord.override {
    withOpenASAR = true;
    withVencord = true;
    })

    # networking
    zerotierone

    # utils
    jellyfin-ffmpeg
    android-tools
    appimage-run
    libreoffice
    xwaylandvideobridge

    # web browsers
    firefox
    chromium
    floorp

    # extras
    lsd # ls replacement
    bat # cat replacement
    glances # htop replacement
    lxde.lxsession
    # oh-my-zsh plugins
    thefuck # Magnificent app which corrects your previous console command
    zsh
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
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraConfig = ''
        let g:python3_host_prog = "${pkgs.python3}/bin/python";
      '';

      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        plenary-nvim
        gruvbox-material
        mini-nvim
      ];
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "lsd";
        la = "lsd -a";
        ll = "lsd -l";
        cat = "bat";
        cp = "cp -riv";
        mkdir = "mkdir -vp";
        mv = "mv -iv";
        rm = "rm -riv";
        rebuild = "nixos-rebuild switch";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ 
          "git" 
          "thefuck"
        ];
        theme = "robbyrussell";
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
