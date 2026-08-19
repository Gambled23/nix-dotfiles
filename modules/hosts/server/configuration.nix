{ self, inputs, ... }: {
  flake.nixosConfigurations.server-gambled = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.serverHardware
      self.nixosModules.machineCore
      self.nixosModules.machineServer
      self.nixosModules.myHomeManager
      self.nixosModules.bootGrub
      self.nixosModules.glances
      self.nixosModules.homeassistant
      self.nixosModules.homepageDashboard
      self.nixosModules.codeServer
      self.nixosModules.nginx
      self.nixosModules.pihole
      self.nixosModules.vaultwarden
      self.nixosModules.server-gambledModule
    ];
  };

  flake.nixosModules.server-gambledModule = { pkgs, ... }: {
    system.stateVersion = "26.11";
    networking.hostName = "server-gambled";

    networking.networkmanager = {
      insertNameservers = [ 
        "192.168.1.27"
        "1.1.1.1"
        "8.8.8.8" 
      ];
    };

    nix.settings = {
      max-jobs = 1;
      cores = 2;
    };

    home-manager.users.gambled = self.homeModules.serverGambledHomeModule;
  };
}
