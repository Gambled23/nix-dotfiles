{ self, inputs, ... }: {
  flake.nixosModules.noctaliaGreeter = { pkgs, ... }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

      greeter-args = "";
      settings = {
        cursor = {
          theme = "Bibata-Modern-Ice";
          size = 24;
          path = "${pkgs.bibata-cursors}/share/icons";
        };
        keyboard = {
          layout = "us";
        };
      };
    };
    
    services.displayManager = {
      defaultSession = "mango";
      autoLogin.enable = true;
      autoLogin.user = "gambled";
    };
  };
}
