{ config, lib, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm; #for amd gpu support

    loadModels = [
      "qwen3-coder"
      "qwen3.5"
      "deepseek-r1"
    ];
    syncModels = true; #Synchronize all currently installed models with those declared in services.ollama.loadModels, removing any models that are installed but not currently declared there.

    openFirewall = true;
    host = "0.0.0.0";
    port = 11434;
  };
}
