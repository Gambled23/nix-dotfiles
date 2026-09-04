{ self, inputs, ... }: {
  flake.nixosModules.noctaliaGreeter = { pkgs, lib, config, ... }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

      greeter-args = "";
      settings = {
        # cursor = {
        #   theme = config.theme.cursorTheme.name;
        #   size = 24;
        #   path = "${config.theme.cursorTheme.package}/share/icons";
        # };
        keyboard = {
          layout = "us";
        };
      };
    };

    services.greetd.settings = lib.mkIf (config.networking.hostName == "pc-gambled") {
      initial_session = {
        command = "mango";
        user = "gambled";
      };
    };
  };
}
