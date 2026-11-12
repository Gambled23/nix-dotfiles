{ self, inputs, ... }: {
  flake.nixosModules.duxGreeter = { pkgs, lib, config, ... }: {
    services.displayManager = {
      autoLogin = lib.mkIf (config.networking.hostName == "pc-gambled") {
        enable = true;
        user = "gambled";
      };
      dux-greeter = {
        enable = true;
        # package = inputs.dux-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
        compositor.name = "mangowc";
        configHome = "${config.users.users.gambled.home}";
      };
    };

    security.pam.services.greetd = {
      fprintAuth = true;
      u2fAuth = true;
    };
  };
}
