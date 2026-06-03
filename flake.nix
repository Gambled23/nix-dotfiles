{
  description = "Gambled's NixOS configuration - ( 'ω')/";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nvf.url = "github:NotAShelf/nvf";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";
    # #nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    # myWebService.url = "path:/home/gambled/Codes/financiero";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
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

    accela = {
      url = "github:gambled23/enter-the-wired/fix-accela-hash";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nur repo for firefox extensions
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    # ambxst.url = "github:Axenide/Ambxst";
    # ambxst.url = "github:smarthumankinda/ambxst-flake";

    # dms = {
    #   url = "github:AvengeMedia/DankMaterialShell/stable";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # dms-plugin-registry = {
    #   url = "github:AvengeMedia/dms-plugin-registry";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    jovian-nixos,
    spicetify-nix,
    nixos-hardware,
    nix-index-database,
    nur,
    niri,
    antigravity-nix,
    ...
    }@inputs:
  let
    specialArgs = {
      inherit inputs;
      inherit home-manager;
      inherit jovian-nixos;
      inherit spicetify-nix;
      inherit nixos-hardware;
      inherit nix-index-database;
      inherit nur;
      inherit niri;
      inherit antigravity-nix;
    };

    coreModules = [
      nix-index-database.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.backupFileExtension = "back";
        home-manager.overwriteBackup = true;
      }
    ];
  in {
    nixosConfigurations = {
      "dev-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = coreModules ++ [
          ./Hosts/dev-gambled/configuration.nix
          # inputs.myWebService.nixosModules.financiero
          {
            home-manager.users.gambled.imports = [
              ./Hosts/dev-gambled/home.nix
            ];
          }
        ];
      };

      "pc-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = coreModules ++ [
          ./Hosts/pc-gambled/configuration.nix
          jovian-nixos.nixosModules.default
          nixos-hardware.nixosModules.gigabyte-b650
          {
            home-manager.users.gambled.imports = [
              ./Hosts/pc-gambled/home.nix
            ];
          }
        ];
      };

      "server-gambled" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = coreModules ++ [
          ./Hosts/server-gambled/configuration.nix
          {
            home-manager.users.gambled.imports = [
              ./Hosts/server-gambled/home.nix
            ];
          }
        ];
      };
    };
  };
}
