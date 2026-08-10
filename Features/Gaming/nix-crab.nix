{inputs, ...}:{
  imports = [
    inputs.nix-crab.homeModules.default
  ];

  programs.nix-crab.steamidra.enable = true;
}