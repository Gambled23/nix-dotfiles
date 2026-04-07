{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
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

    sls-steam = {
      url = "github:AceSLS/SLSsteam";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    accela = {
      url = "github:ciscosweater/enter-the-wired";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Nur repo for firefox extensions
    # nur.url = "github:nix-community/NUR";
    # nur.inputs.nixpkgs.follows = "nixpkgs";

    #nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    # Steam thingies
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    # jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";
  };

  outputs = { 
      self, 
      nixpkgs, 
      home-manager,
      spicetify-nix, 
      nixos-hardware,
      # nur,
      nixcord,
      # jovian-nixos,
      # dolphin-overlay,
      stylix,
      vicinae,
      millennium,
      sls-steam,
      nix-index-database,
      ... 
     }@inputs:
  let
    specialArgs = {
      inherit inputs;
      inherit spicetify-nix;
    };

    commonModules = [
      nix-index-database.nixosModules.default
      home-manager.nixosModules.home-manager
      # nur.modules.nixos.default
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.gambled.imports = [
          inputs.nix-flatpak.homeManagerModules.nix-flatpak
          inputs.nvf.homeManagerModules.default
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
              # ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModules.default
              ./core/programs/spicetify.nix
              inputs.nixcord.homeModules.nixcord
              inputs.sls-steam.homeModules.sls-steam
              ./core/programs/nixcord.nix
              vicinae.homeManagerModules.default
            ];
            home-manager.backupFileExtension = "uiod";
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
              # ./core/services/xserver/kde/config.nix
              spicetify-nix.homeManagerModules.default
              ./core/programs/spicetify.nix
              inputs.nixcord.homeModules.nixcord
              ./core/programs/nixcord.nix
              vicinae.homeManagerModules.default
            ];
            home-manager.backupFileExtension = "2";
            nixpkgs.overlays = [
              # dolphin-overlay.overlays.default
            ];
          }
        ];
      };

    };
  };
}
