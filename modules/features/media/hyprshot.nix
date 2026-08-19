{ self, inputs, ... }: {
  flake.homeModules.hyprshot = { pkgs, ... }: {
    programs.hyprshot = {
      enable = true;
      saveLocation = "$HOME/Pictures/Screenshots";
    };
  };
}
