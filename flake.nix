{
  description = "NixOS configuration";

  inputs = {
    #nixpkgs = { url = "github:nixos/nixpkgs/nixos-23.11"; };
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      "dev-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./devices/dev/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/dev/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
            ];
          }
        ];
        specialArgs = { inherit inputs; };
      };
      "pc-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./devices/pc/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/pc/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
            ];
          }
        ];
      };
      "laptop-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./devices/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/laptop/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
            ];
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
