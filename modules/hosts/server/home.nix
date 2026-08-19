{ self, inputs, ... }: {
  # Standalone home-manager configuration (for home-manager CLI on server)
  flake.homeConfigurations."gambled@server-gambled" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.serverGambledHomeModule
      {
        home.username = "gambled";
        home.homeDirectory = "/home/gambled";
      }
    ];
  };

  flake.homeModules.serverGambledHomeModule = { pkgs, ... }: {
    home.stateVersion = "26.05";
    imports = [
      self.homeModules.machineCoreHome
    ];

    home.packages = with pkgs; [
      lm_sensors
    ];
  };
}
