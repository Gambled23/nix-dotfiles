{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    stylix.url = "github:danth/stylix";

    # Nur repo for firefox extensions
    # nur.url = "github:nix-community/NUR";
    # nur.inputs.nixpkgs.follows = "nixpkgs";

    #nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    # Steam thingies
    # millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";
    # jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";


    #stremio qt5
    nixpkgs-for-stremio.url = "nixpkgs/5135c59491985879812717f4c9fea69604e7f26f";
  };

  outputs = { 
      self, 
      nixpkgs, 
      home-manager,
      plasma-manager, 
      spicetify-nix, 
      nixos-hardware,
      # nur,
      nixcord,
      # jovian-nixos,
      stylix,
      # millennium,
      ... 
     }@inputs:
  let
    specialArgs = {
      inherit inputs;
      inherit spicetify-nix;
    };

    commonModules = [
      home-manager.nixosModules.home-manager
      # jovian-nixos.nixosModules.default
      # nur.modules.nixos.default
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        # home-manager.users.gambled.imports = [
        # ];
        home-manager.extraSpecialArgs = specialArgs;
      }
    ];
  in {
    nixosConfigurations = {

      "pc-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = commonModules ++ [
          ./devices/pc/configuration.nix
          nixos-hardware.nixosModules.gigabyte-b650
          stylix.nixosModules.stylix
          {
            home-manager.users.gambled.imports = [
              ./devices/pc/home.nix
              inputs.plasma-manager.homeModules.plasma-manager
              ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModules.default
              ./core/programs/spicetify.nix
              inputs.nixcord.homeModules.nixcord
              ./core/programs/nixcord.nix
              inputs.walker.homeManagerModules.default
            ];
            home-manager.backupFileExtension = "uiod";
            # nixpkgs.overlays = [
              # inputs.millennium.overlays.default
            # ];
          }
        ];
      };

      "server-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = commonModules ++ [
          ./devices/server/configuration.nix
          {
            home-manager.users.gambled.imports = [
              ./devices/server/home.nix
            ];
            home-manager.backupFileExtension = "meme";
          }
        ];
      };

      "dev-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = commonModules ++ [
          ./devices/dev/configuration.nix
          stylix.nixosModules.stylix
          {
            home-manager.users.gambled.imports = [
              ./devices/dev/home.nix
              inputs.plasma-manager.homeModules.plasma-manager
              ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModules.default
              ./core/programs/spicetify.nix
              inputs.nixcord.homeModules.nixcord
              ./core/programs/nixcord.nix
              inputs.walker.homeManagerModules.default
            ];
            home-manager.backupFileExtension = "uiod";
            # nixpkgs.overlays = [
              # inputs.millennium.overlays.default
            # ];
          }
        ];
      };

    };
  };
}
