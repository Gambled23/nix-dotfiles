{ self, inputs, ... }: {
  flake.homeModules.alacritty = { pkgs, ... }: {
    programs.alacritty = {
      enable = true;
      settings = {
        import = [
          "${pkgs.vimPlugins.nightfox-nvim}/extra/carbonfox/nightfox_alacritty.yml"
        ];
        window = {
          padding = {
            x = 12;
            y = 12;
          };
        };
        shell = {
          program = "/usr/bin/env zsh";
        };
      };
    };
  };
}
