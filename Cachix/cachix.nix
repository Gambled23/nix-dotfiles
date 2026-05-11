
# WARN: this file will get overwritten by $ cachix use <name>
{ pkgs, lib, ... }:

let
  folder = ./data;
  toImport = name: value: folder + ("/" + name);
  filterCaches = key: value: value == "regular" && lib.hasSuffix ".nix" key;
  imports = lib.mapAttrsToList toImport (lib.filterAttrs filterCaches (builtins.readDir folder));
in {
  inherit imports;

  nix = {
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
        "https://vicinae.cachix.org"
        "https://yazi.cachix.org"
        "https://cache.nixos.org/"
        "https://nvf.cachix.org"
        "https://noctalia.cachix.org"
        "https://jovian.cachix.org/"
      ];

      trusted-substituters = [
        "https://hyprland.cachix.org"
        "https://vicinae.cachix.org"
        "https://yazi.cachix.org"
        "https://cache.nixos.org/"
        "https://nvf.cachix.org"
        "https://noctalia.cachix.org"
        "https://jovian.cachix.org/"
      ];
      
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        "jovian.cachix.org-1:8Vq4Txku6VZIRhYrHYki3Ab9XHJRoWmdYqMqj4rB/Uc="
      ];
    };
  };
}
