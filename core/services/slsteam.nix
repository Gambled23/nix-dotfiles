{ inputs, config, pkgs, lib, ... }:

{
  services.sls-steam.config = {
    PlayNotOwnedGames = true;
    DisableFamilyShareLock = true;
    AppIds = [
      2868840 # Slay the Spire 2
      4130120 # Genome Guardian 2
      2161700 # Persona 3 Reload
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
    ];
    AdditionalApps = [
      2868840 # Slay the Spire 2
      4130120 # Genome Guardian 2
      2161700 # Persona 3 Reload
      1647550 # NEO: The World Ends with You
      2356780 # Dungeon Clawler
    ];
    SafeMode = true;
  };

  programs.mangohud = {
    enable = true;
    settings = {
      toggle_hud = "F11";
    };
  };
}
