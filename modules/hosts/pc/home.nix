{ self, inputs, ... }: {
  # Standalone home-manager configuration (for home-manager CLI on pc)
  flake.homeConfigurations."gambled@pc-gambled" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.pcGambledHomeModule
      {
        home.username = "gambled";
        home.homeDirectory = "/home/gambled";
      }
    ];
  };

  flake.homeModules.pcGambledHomeModule = { pkgs, ... }: {
    home.stateVersion = "26.05";
    imports = [
      self.homeModules.machineCoreHome
      self.homeModules.machineDesktopHome
      self.homeModules.sls-steam
    ];

    home.packages = with pkgs; [
      # pkgs.nur.repos.Ev357.hayase
      (pkgs.callPackage ../../../pkgs/hayase/package.nix { })
      # ludusavi
      # gamemode
      # winetricks
      # steam-rom-manager
      prismlauncher
      guitarix
      # fretboard
      # pywalfox-native
      polychromatic
      headsetcontrol
      # qbittorrent
      # obs-studio
    ];

    home.file.".zshrc".text = "export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL}/lib/:${pkgs.libxkbcommon}/lib/:${pkgs.libx11}/lib/:${pkgs.fontconfig}/lib";
  };
}
