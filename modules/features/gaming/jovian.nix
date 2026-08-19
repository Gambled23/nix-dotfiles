{ self, inputs, ... }: {
  flake.nixosModules.jovian = { pkgs, ... }: {
    imports = [
      inputs.jovian-nixos.nixosModules.default
    ];

    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };

    programs.gamemode.enable = true;

    jovian = {
      steam = {
        enable = true;
        user = "gambled";
        updater.splash = "jovian";
      };
      decky-loader = {
        enable = true;
        user = "gambled";
      };
      hardware.has.amd.gpu = true;
    };

    system.userActivationScripts.linktosharedfolder.text = ''
      if [[ ! -h "$HOME/.homebrew" ]]; then
        ln -s "/var/lib/decky-loader/" "$HOME/.homebrew"
      fi
    '';
  };
}
