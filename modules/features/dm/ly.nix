{ self, inputs, ... }: {
  flake.nixosModules.ly = { pkgs, ... }: {
    # Display manager and session
    services.displayManager = {
      defaultSession = "mango";
      autoLogin = {
        enable = true;
        user = "gambled";
      };
      ly = {
        enable = true;
      };
    };
  };
}
