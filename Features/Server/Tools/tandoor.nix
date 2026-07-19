{ config, pkgs, lib, ... }:
# Recipe manager for home cooking
{
  services.tandoor-recipes = {
    enable = true;
    address = "10.243.0.1";
    port = 8124;
  };
}
