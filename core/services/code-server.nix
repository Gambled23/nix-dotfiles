{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.code-server = {
    enable = true;
    user = "gambled";
    group = "users";
    port = "44445";
  };
}