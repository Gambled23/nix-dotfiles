{...}:
{
  imports = [
    # ./jovian/jovian-config.nix
    ./sls-steam/sls-steam-config.nix
    # ./nix-crab/nix-crab-config.nix
  ];

  # programs.mangohud = {
  #   enable = true;
  #   settings = {
  #     toggle_hud = "F11";
  #   };
  # };
}