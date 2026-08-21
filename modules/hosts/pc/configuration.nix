{ self, inputs, ... }: {
  flake.nixosConfigurations.pc-gambled = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.pcHardware
      inputs.nixos-hardware.nixosModules.gigabyte-b650
      self.nixosModules.machineCore
      self.nixosModules.machineDesktop
      self.nixosModules.myHomeManager
      self.nixosModules.bootGrub
      self.nixosModules.glances
      self.nixosModules.steam
      self.nixosModules.sunshine
      self.nixosModules.wakeonlan
      self.nixosModules.pc-gambledModule
    ];
  };

  flake.nixosModules.pc-gambledModule = { pkgs, ... }: {
    system.stateVersion = "26.11";
    networking.hostName = "pc-gambled";

    environment.systemPackages = with pkgs; [
      lsfg-vk # Loseless scaling
      lsfg-vk-ui # Loseless scaling
      lact # gpu overclocking
      i2c-tools # for monitoring sensors
      eden
      dolphin-emu
      dotnet-runtime_9
    ];

    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = [ "multi-user.target" ];

    networking.networkmanager = {
      insertNameservers = [ 
        "192.168.1.27"
        "1.1.1.1"
        "8.8.8.8" 
      ];
    };

    home-manager.users.gambled = self.homeModules.pcGambledHomeModule;
  };
}
