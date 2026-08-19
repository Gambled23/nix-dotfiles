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
      plugins = [
        "7913678dca95" # ProtonDB
        "ade101371bfd" # Global launch options
        "266c815057f2" # Steam librarian
        "f685622bace6" # HLTB
        "e73371b61eef" # Size on disk
        "2519c8a9fc97" # Easy steamgrid
        "02bed50d10a8" # Non steam playtime
        "788ed8554492" # Extendium
      ];
      themes = [ 
        "ipYjqODds05KMcvh7QJn" # Material
        "hvGem3YVgRwPdDumShwq" # Juxtematic
        "i3soOaPP2V7P0VO7W4pq" # QOL toggles
      ];
    };
  };
}