{ config, lib, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama; #for amd gpu support

    # loadModels = [
    #   "gemma4:e2b"
    # ];
    # syncModels = true;

    openFirewall = true;
    # host = "pc-gambled";
    port = 11434;
    environmentVariables = {
      OLLAMA_HOST = "pc-gambled:11434";
      OLLAMA_NO_CLOUD = "1";
    };
  };
}
