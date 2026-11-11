{ self, inputs, ... }: {
  flake.homeModules.machineDesktopHome = { pkgs, lib, config, ... }: {
    imports = [
      self.homeModules.antigravity-cli
      self.homeModules.mcpServers
      self.homeModules.kitty
      # self.homeModules.spotifyPlayer
      self.homeModules.vicinae
      self.homeModules.nixcord
      self.homeModules.mangowmHome
      # self.homeModules.noctalia5
      self.homeModules.duxShell
      self.homeModules.matugen
    ];

    programs.matugen = {
      enable = true;
      variant = "dark"; # "dark" or "light" (selects matching template variant when specified)
      # communityTemplates = [ 
      #   "discord" 
      #   "gimp" 
      #   "steam" 
      #   "vicinae"  
      # ];

      communityTemplates = [ 
        "antigravity" 
        # "spicetify" 
        "spotifast" 
        "discord" 
        "gimp" 
        "libreoffice" 
        "vscode" 
        "steam" 
        "vicinae" 
        "bat" 
        "fzf" 
        "lazygit" 
        "tmux" 
        "yazi" 
      ];
    };
    
    home.packages = with pkgs; [
      self.packages.${pkgs.stdenv.hostPlatform.system}.flash-kernelsu

      #* Dev tools
      nodejs_26
      github-cli
      dbeaver-bin
      vscode-fhs

      # inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-no-fhs # Base App
      # inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide-no-fhs # IDE
      # inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
      
      #* Media 
      loupe # Image viewer
      vlc
      gimp-with-plugins
      # (pkgs.callPackage ../../../pkgs/nuvio/package.nix { })
      inputs.nuvio.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nuvio-desktop

      #* Messaging
      altus
      beeper

      # Theming
      # bibata-cursors
      colloid-cursors
      colloid-icon-theme
      # papirus-icon-theme

      # Tools
      # rbw
      android-tools
      # gnome-control-center
      gnome-clocks
      # gnome-calendar
      # gnome-contacts
      gparted
      libreoffice-stable
      # nautilus
      qalculate-gtk
      scrcpy
      seahorse # gnome keyring manager
      siyuan
      # via
      wdisplays # wlr-randr gui
      bitwarden-desktop

      #* webbrowsers
      google-chrome
      # inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    services.flatpak.packages = [
      "com.artemchep.keyguard"
    ];

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "draw.desktop" ];
        "image/*" = [
          "org.gnome.Loupe.desktop"
          "gimp.desktop"
        ];
        "video/*" = [ "vlc.desktop" ];
        "audio/*" = [ "vlc.desktop" ];
        "text/calendar" = [
          "dev.duxlabs.calendar.desktop"
          "com.google.Chrome.desktop"
        ];
        "inode/directory" = [
          "dev.duxlabs.files.desktop"
          "yazi.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
    };

    # services.gpg-agent = {
    #   enable = true;
    #   pinentryPackage = pkgs.pinentry-gnome3;
    # };
  };
}
