{
  inputs,
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.nvf.homeManagerModules.default
    inputs.stylix.homeModules.stylix

    ../../Features/Dev/direnv.nix
    ../../Features/Dev/git.nix
    ../../Features/Dev/neovim.nix

    ../../Features/Tools/btop.nix
    ../../Features/Tools/Files/lsd.nix
    ../../Features/Tools/Files/zoxide.nix
    ../../Features/Tools/Files/yazi/yazi.nix

    ../../Features/Ricing/CLI/starship.nix
    ../../Features/Ricing/CLI/zsh.nix
    ../../Features/Ricing/WM/Hyprland/stylix.nix

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
    HOSTNAME = osConfig.networking.hostName or "nixos";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    iconTheme.name = "Papirus";
    cursorTheme.name = "Bibata-Modern-Ice";
    cursorTheme.size = 24;
  };

  qt =
  let 
    qtsettings = {
      Appearance = {
        icon_theme = "Papirus";
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
