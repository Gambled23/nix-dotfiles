{ self, inputs, ... }: {
  flake.homeModules.btop = { pkgs, ... }: {
    programs.btop = {
      enable = true;
      settings = {
        truecolor = false;
        theme_background = false;
        vim_keys = true;
        color_theme = "noctalia";
      };
    };
  };
}
