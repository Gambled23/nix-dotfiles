{ self, inputs, ... }: {
  flake.nixosModules.skwd = { config, lib, pkgs, ... }: {
    imports = [
      inputs.skwd.nixosModules.default
    ];

    services.skwd-deck = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      steamcmd
    ];
  };
}
