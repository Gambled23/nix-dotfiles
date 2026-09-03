{ self, inputs, ... }: {

  # This is your system configuration entry-point
  flake.nixosConfigurations.dev-gambled = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.devHardware
      self.nixosModules.dev-gambledModule
      self.nixosModules.myHomeManager

      # Machine Profiles & Features
      self.nixosModules.machineCore
      self.nixosModules.machineDesktop
      self.nixosModules.bootGrub
      self.nixosModules.docker
    ];
  };

  # This is your configuration.nix, a place where you configure your system
  # You can place it in a separate file.
  flake.nixosModules.dev-gambledModule = { pkgs, ... }: {
    system.stateVersion = "26.11";
    networking.hostName = "dev-gambled";

    users.users.gambled = {
      isNormalUser = true;
    };

    nix.settings = {
      max-jobs = 4;
      cores = 4;
    };

    # services.cng-plus-ml = {
    #   enable = true;
    #   workingDir = "/home/gambled/Codes/cng-plus-ml";
    # };

    swapDevices = [ {
      device = "/var/lib/swapfile";
      size = 16*1024;
    } ];

    programs.moonlight-qt = {
      enable = true;
      capSysNice = true;
      package = (pkgs.moonlight-qt.override {
        ffmpeg_8 = pkgs.ffmpeg_6;
      });
    };

    services.flatpak.enable = true; # Enable flatpak

    home-manager.users.gambled = self.homeModules.gambledModule;
  
    # nixpkgs.config.permittedInsecurePackages = [
    #   "electron-40.10.5"
    # ];
  };
}