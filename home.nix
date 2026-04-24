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
    core/programs/yazi/yazi.nix
    core/programs/zsh.nix
    core/programs/zoxide.nix
  ];
  
  home.packages = with pkgs; [
    #* dev tools
    gh
    lazyjournal
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
    rbw
  ];
  
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
