{ inputs, config, pkgs, lib, ... }:

{
  services.sls-steam.config = {
    PlayNotOwnedGames = true;
    DisableFamilyShareLock = true;
    AppIds = [
      2868840 # Slay the Spire 2
      4130120 # Genome Guardian 2
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
      1295320 # Can of Wormholes
      3035120 # Is This Seat Taken
      3401490 # Replicube
      2239150 # Thronefall
      2968420 # PowerWash Simulator 2
      3110070 # Fever Meme
      1988550 # To The Core
      1880620 # Once Upon A KATAMARI
      3314790 # CloverPit
      2779120 # Modulus Factory Automation
    ];
    AdditionalApps = [
      2868840 # Slay the Spire 2
      4130120 # Genome Guardian 2
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
      1295320 # Can of Wormholes
      3035120 # Is This Seat Taken
      3401490 # Replicube
      2239150 # Thronefall
      2968420 # PowerWash Simulator 2
      3110070 # Fever Meme
      1988550 # To The Core
      1880620 # Once Upon A KATAMARI
      3314790 # CloverPit
      2779120 # Modulus Factory Automation
    ];
    SafeMode = true;
  };

  programs.mangohud = {
    enable = true;
    settings = {
      toggle hud = "F11";
    };
  };
}
