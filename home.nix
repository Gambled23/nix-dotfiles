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

  gtk = {
    enable = true;
    theme.name = "noctalia";
  };

  qt =
  let 
    qtsettings = {
      Appearance = {
        icon_theme = "Reversal";
        style = "Fusion";
        custom_palette = "true";
        color_scheme_path = "$HOME/.config/qt6ct/colors/noctalia.conf";  
      };
    };
  in 
  {
    enable = true;
    style.name = "noctalia";

    qt5ctSettings = qtsettings;
    qt6ctSettings = qtsettings;
  };
}
