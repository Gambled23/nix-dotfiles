{ self, inputs, ... }: {
  flake.nixosModules.coolercontrol = { pkgs, ... }: {
    programs.coolercontrol = {
      enable = true;
    };
  };
}
