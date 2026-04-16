{ config, lib, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm; #for amd gpu support

    # loadModels = [
    #   "gemma4:e2b"
    # ];
    # syncModels = true; #Synchronize all currently installed models with those declared in services.ollama.loadModels, removing any models that are installed but not currently declared there.

    openFirewall = true;
    host = "10.243.0.2";
    port = 11434;
    environmentVariables = {
      OLLAMA_HOST = "10.243.0.2:11434";
    };
  };
}
