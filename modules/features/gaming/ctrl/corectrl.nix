{ self, inputs, ... }: {
  flake.nixosModules.corectrl = { pkgs, ... }: {
    programs.corectrl = {
      enable = true;
      gpuOverclock.enable = true;
    };
  };
}
