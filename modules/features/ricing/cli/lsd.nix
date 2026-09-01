{ self, inputs, ... }: {
  flake.homeModules.lsd = { pkgs, ... }: {
    programs.lsd = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        hyperlink = "auto";
        header = true;
      };
    };
  };
}
