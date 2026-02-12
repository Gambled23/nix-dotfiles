{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # dolphin-overlay.url = "github:rumboon/dolphin-overlay";
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # ambxst.url = "github:Axenide/Ambxst";
    # ambxst.url = "github:smarthumankinda/ambxst-flake"; 

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
    # Nur repo for firefox extensions
    # nur.url = "github:nix-community/NUR";
    # nur.inputs.nixpkgs.follows = "nixpkgs";

    #nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    # Steam thingies
    # millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";
    # jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";
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
      # dolphin-overlay,
      stylix,
      vicinae,
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
      # nur.modules.nixos.default
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.gambled.imports = [
          inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ];
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
          # jovian-nixos.nixosModules.default
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
              vicinae.homeManagerModules.default
            ];
            home-manager.backupFileExtension = "uiod";
            nixpkgs.overlays = [
              # inputs.millennium.overlays.default
              # dolphin-overlay.overlays.default
            ];
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
              vicinae.homeManagerModules.default
            ];
            home-manager.backupFileExtension = "2";
            nixpkgs.overlays = [
              # inputs.millennium.overlays.default
              # dolphin-overlay.overlays.default
            ];
          }
        ];
      };

    };
  };
}
