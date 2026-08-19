{ self, inputs, ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = "ipog71@gmail.com";
          name = "Gambled23";
        };
      };
    };
  };
}
