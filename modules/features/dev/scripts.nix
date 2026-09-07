{ self, inputs, ... }: {

  perSystem = { pkgs, ... }: {
    packages = builtins.listToAttrs (
      map (file: {
        name = pkgs.lib.removeSuffix ".nix" file;
        value = pkgs.callPackage (./_scripts + "/${file}") { };
      }) (builtins.filter (pkgs.lib.hasSuffix ".nix") (builtins.attrNames (builtins.readDir ./_scripts)))
    );
  };

  flake.nixosModules.coreScripts = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.nix-rbd
      self.packages.${pkgs.stdenv.hostPlatform.system}.agc
      self.packages.${pkgs.stdenv.hostPlatform.system}.ssh-github
    ];
  };

  flake.nixosModules.desktopScripts = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.display-device
      self.packages.${pkgs.stdenv.hostPlatform.system}.flash-kernelsu
      self.packages.${pkgs.stdenv.hostPlatform.system}.scrcpy-desktop-mode
    ];
  };
}
