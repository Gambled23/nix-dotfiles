{ self, inputs, ... }: {
  flake.homeModules.machineCoreHome = { pkgs, config, osConfig, lib, ... }: {
    programs.home-manager.enable = true;

    imports = [
      self.homeModules.btop
      self.homeModules.direnv
      self.homeModules.git
      self.homeModules.neovim
      self.homeModules.ssh
      self.homeModules.starship
      self.homeModules.stylix
      self.homeModules.themeOptions
      self.homeModules.yazi
      self.homeModules.zoxide
      self.homeModules.zsh
    ];

    home.packages = with pkgs; [
      #* dev tools
      gh
      # tmux
      lazyjournal
      devenv
      lazygit
      fzf
      jq

      #* extras
      bat
      # inputs.iris.packages.${pkgs.system}.default
      lxsession
      fastfetch
      zsh
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      HOSTNAME = osConfig.networking.hostName or "nixos";
    };

    home.pointerCursor = lib.mkDefault {
      enable = true;
      name = config.theme.cursorTheme.name;
      package = config.theme.cursorTheme.package;
      size = 24;
      gtk.enable = true;
    };
    systemd.user.startServices = "sd-switch";

    gtk = let
      dmsEnabled = lib.attrByPath [ "programs" "dank-material-shell" "enable" ] false config;
      dmsCss = ''
        @import url("dank-colors.css");
      '';
    in {
      enable = true;
      theme.name = "adw-gtk3-dark";
      iconTheme.name = config.theme.iconTheme.name;
      cursorTheme.name = config.theme.cursorTheme.name;
      cursorTheme.size = 24;

      gtk3.extraCss = lib.mkIf dmsEnabled dmsCss;
      gtk4.extraCss = lib.mkIf dmsEnabled dmsCss;
    };

    qt = let 
      qtsettings = {
        Appearance = {
          icon_theme = config.theme.iconTheme.name;
          style = "Fusion";
          custom_palette = "true";
          color_scheme_path = "$HOME/.config/qt6ct/colors/noctalia.conf";
        };
      };
    in {
      enable = true;
      # style.name = "noctalia";
      # qt5ctSettings = qtsettings;
      # qt6ctSettings = qtsettings;
    };
  };
}
