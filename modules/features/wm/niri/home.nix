{ self, inputs, ... }: {
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
