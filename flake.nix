{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    
    # jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";

    #nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    #kde2nix.url = "github:nix-community/kde2nix";
    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs = { 
      self, 
      nixpkgs, 
      home-manager,
      plasma-manager, 
      spicetify-nix, 
      #kde2nix, 
      nur,
      nixcord,
      # jovian-nixos,
      ... 
     }@inputs:
    let
      specialArgs = {
        inherit spicetify-nix;
        inherit inputs;
      };

      commonModules = [
        home-manager.nixosModules.home-manager
        #stylix.nixosModules.stylix
        # jovian-nixos.nixosModules.default
        nur.modules.nixos.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gambled.imports = [
            inputs.plasma-manager.homeManagerModules.plasma-manager
            ./core/services/xserver/kde/config.nix
            spicetify-nix.homeManagerModules.default
            ./core/programs/spicetify.nix
            inputs.nixcord.homeModules.nixcord
            ./core/programs/nixcord.nix
          ];
          home-manager.extraSpecialArgs = specialArgs;
        }
      ];

    in {
      nixosConfigurations = {

        "pc-gambled" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./devices/pc/configuration.nix
            {
              home-manager.users.gambled.imports = [
                ./devices/pc/home.nix
              ];
              home-manager.backupFileExtension = "meme";
            }
          ];
        };


        "laptop-gambled" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = commonModules ++ [
            ./devices/laptop/configuration.nix
            {
              home-manager.users.gambled.imports = [
                ./devices/laptop/home.nix
              ];
              home-manager.backupFileExtension = "meme";
            }
          ];
        };

      };
    };
}