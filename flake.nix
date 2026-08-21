{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-gambled.url = "github:Gambled23/nixpkgs";
    nuvio.url = "github:griffi-gh/nixpkgs/init-nuvio";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    
    nixcord.url = "github:kaylorben/nixcord";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nvf.url = "github:NotAShelf/nvf";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    jovian-nixos.url = "github:Jovian-Experiments/Jovian-NixOS";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    mangowm.url = "github:mangowm/mango";
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions.url = "github:vicinaehq/extensions";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    

    # nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    # hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins.url = "github:hyprwm/Hyprland-plugins";



    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sls-steam = {
      url = "github:AceSLS/SLSsteam";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-crab.url = "github:ItszFinn/nix-crab";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    accela = {
      url = "github:ciscosweater/enter-the-wired";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nur repo for firefox extensions
    nixpkgsnur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # monique = {
    #   url = "github:ToRvaLDz/monique";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    # ambxst.url = "github:Axenide/Ambxst";
    # ambxst.url = "github:smarthumankinda/ambxst-flake";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Alpha
    alpha-server = {
      url = "path:/home/gambled/Codes/nixos-alpha-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # cng-plus-ml = {
    #   url = "path:/home/gambled/Codes/cng-plus-ml";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    moonshine.url = "github:hgaiser/moonshine";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}