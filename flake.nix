{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";
    #nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";


    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    kde2nix.url = "github:nix-community/kde2nix";
    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, spicetify-nix, kde2nix, ... }@inputs:
    let
    specialArgs = {
      inherit spicetify-nix;
      inherit inputs;
    };
    in {
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
              spicetify-nix.homeManagerModules.default
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
          #stylix.nixosModules.stylix
          #jovian-nixos.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/pc/home.nix

              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix

              spicetify-nix.homeManagerModules.default
              ./core/programs/spicetify.nix

              inputs.nixcord.homeManagerModules.nixcord
              ./core/programs/nixcord.nix
            ];
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.backupFileExtension = "meme";
          }
        ];
      };

      "laptop-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          #stylix.nixosModules.stylix
          #jovian-nixos.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gambled.imports = [
              ./devices/laptop/home.nix

              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./core/services/xserver/kde/config.nix

              spicetify-nix.homeManagerModules.default
              ./core/programs/spicetify.nix

              inputs.nixcord.homeManagerModules.nixcord
              ./core/programs/nixcord.nix
            ];
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}
