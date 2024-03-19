{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    kde2nix.url = "github:nix-community/kde2nix";

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, spicetify-nix, kde2nix, nixpkgs-xr, ... }@inputs:
    let
    specialArgs = {
      inherit spicetify-nix;
      inherit inputs;
    };
    in{
    nixosConfigurations = {
      "dev-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/dev/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/dev/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModule 
              ./core/programs/spicetify.nix
            ];
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };

      "pc-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/pc/configuration.nix
          home-manager.nixosModules.home-manager
          nixpkgs-xr.nixosModules.nixpkgs-xr
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/pc/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModule 
              ./core/programs/spicetify.nix
            ];
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
/*
      "pc-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          kde2nix.nixosModules.plasma6
        ({ services.xserver.desktopManager.plasma6.enable = true; })
          ./devices/pc/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/pc/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModule 
              ./core/programs/spicetify.nix
            ];
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
*/
      "laptop-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/laptop/home.nix
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModule 
              ./core/programs/spicetify.nix
            ];
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}
