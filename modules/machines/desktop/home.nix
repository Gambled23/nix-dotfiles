{ self, inputs, ... }: {
  flake.homeModules.machineDesktopHome = { pkgs, lib, config, ... }: {
    imports = [
      self.homeModules.kitty
      self.homeModules.spicetify
      self.homeModules.spotifyPlayer
      self.homeModules.vicinae
      self.homeModules.nixcord
      self.homeModules.mangowmHome
      self.homeModules.noctaliaHome
    ];
    
    home.packages = with pkgs; [
      self.packages.${pkgs.system}.flash-kernelsu

      #* Dev tools
      github-cli
      vscode
      dbeaver-bin
      antares
      inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-no-fhs # Base App
      inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-ide-no-fhs # IDE
      inputs.antigravity-nix.packages.x86_64-linux.google-antigravity-cli # CLI
      
      #* Media 
      vlc
      gimp-with-plugins
      inputs.nuvio.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nuvio-desktop

      #* Messaging
      altus
      beeper

      # Theming
      bibata-cursors
      papirus-icon-theme

      # Tools
      android-tools
      gnome-calendar
      gnome-control-center
      gnome-contacts
      gparted
      libreoffice-fresh
      nautilus
      qalculate-gtk
      scrcpy
      seahorse # gnome keyring manager
      siyuan
      via
      wdisplays # wlr-randr gui

      #* webbrowsers
      google-chrome
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    services.flatpak.packages = [
      "com.artemchep.keyguard"
    ];
  };
}