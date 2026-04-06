{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    #core/programs/alacritty.nix
    core/programs/btop.nix
    core/programs/direnv.nix
    core/programs/git.nix
    core/programs/lsd.nix
    core/programs/neovim.nix
    core/programs/starship.nix
    # core/programs/yazi/yazi.nix
    core/programs/zsh.nix
    core/programs/zoxide.nix
  ];
  
  home.packages = with pkgs; [
    #* dev tools
    devenv
    lazygit
    fzf
    jq

    #* extras
    bat
    lxsession
    fastfetch
    zsh
    trash-cli	# for yazi trash plugin
  ];
  
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  home.language = {
      base = "en_US.UTF-8";
      ctype = "en_US.UTF-8";
      numeric = "en_US.UTF-8";
      time = "es_ES.UTF-8";
      collate = "en_US.UTF-8";
      monetary = "en_US.UTF-8";
      messages = "en_US.UTF-8";
      paper = "en_US.UTF-8";
      name = "en_US.UTF-8";
      address = "en_US.UTF-8";
      telephone = "en_US.UTF-8";
      measurement = "en_US.UTF-8";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
