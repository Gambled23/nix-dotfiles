{ self, inputs, ... }: {

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.gambled = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.gambledModule
      {
        home.username = "gambled";
        home.homeDirectory = "/home/gambled";
      }
    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.gambledModule = { pkgs, ... }: {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      self.homeModules.machineCoreHome
      self.homeModules.machineDesktopHome
      (inputs.alpha-server.homeModules.devScripts)
    ];

    home.packages = with pkgs; [
      #* dev tools
      # bruno
      # awscli
      # winboat

      remmina
      mariadb
      # android-studio
      # jdk25_headless

      #* utils
      # moonlight-qt
      gnome-network-displays

      # nchat # whatsapp cli
    ];
    
    home.stateVersion = "26.11";
  };

}
