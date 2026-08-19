{ self, inputs, ... }: {
  flake.homeModules.machineCoreHome = { pkgs, config, osConfig, lib, ... }: {
    programs.home-manager.enable = true;

    imports = [
      inputs.stylix.homeModules.stylix

      self.homeModules.stylix
      self.homeModules.neovim
      self.homeModules.git
      self.homeModules.direnv
      self.homeModules.yazi
      self.homeModules.lsd
      self.homeModules.zoxide
      self.homeModules.btop
      self.homeModules.zsh
      self.homeModules.starship
    ];

    home.packages = with pkgs; [
      #* dev tools
      gh
      tmux
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
      rbw
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      HOSTNAME = osConfig.networking.hostName or "nixos";
    };

    home.pointerCursor = lib.mkDefault {
      enable = true;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
    };
    systemd.user.startServices = "sd-switch";

    gtk = {
      enable = true;
      theme.name = "adw-gtk3";
      iconTheme.name = "Papirus";
      cursorTheme.name = "Bibata-Modern-Ice";
      cursorTheme.size = 24;
    };

    qt = let 
      qtsettings = {
        Appearance = {
          icon_theme = "Papirus";
          style = "Fusion";
          custom_palette = "true";
          color_scheme_path = "$HOME/.config/qt6ct/colors/noctalia.conf";
        };
      };
    in {
      enable = true;
      style.name = "noctalia";
      qt5ctSettings = qtsettings;
      qt6ctSettings = qtsettings;
    };
  };
}
