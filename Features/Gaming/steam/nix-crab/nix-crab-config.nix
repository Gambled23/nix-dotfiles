{inputs, ...}:{
  imports = [
    inputs.nix-crab.homeModules.default
  ];

  programs.nix-crab = {
    slssteam.manageConfig = false;
    steamidra.enable = true;
    accela.enable = true;
    luatools.enable = true;
    cloudredirect.moon.enable = true;

    millennium = {
      plugins = [ ];
      themes = [ ];
    };
  };
}