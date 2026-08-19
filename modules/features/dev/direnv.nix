{ self, inputs, ... }: {
  flake.homeModules.direnv = { pkgs, ... }: {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
