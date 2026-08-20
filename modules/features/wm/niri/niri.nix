{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    imports = [
      inputs.niri.nixosModules.niri
    ];

    nixpkgs.overlays = [
      inputs.niri.overlays.niri
    ];

    programs.niri.enable = true;
    programs.niri.package = pkgs.niri-unstable;
  };

  flake.homeModules.niriHome = { pkgs, ... }: {
    imports = [
      ./_configs/binds.nix
      ./_configs/layout.nix
      ./_configs/rules.nix
      ./_configs/spawns.nix

      self.homeModules.vicinae
      self.homeModules.noctaliaHome
    ];

    programs.niri.settings = {
      prefer-no-csd = true;
    };
  };
}
