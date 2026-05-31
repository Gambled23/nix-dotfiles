{ config, lib, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm; #for amd gpu support

    loadModels = [
      "gemma4:e4b"
      # "qwen2.5-coder:3b"
      # "qwen2.5-coder:7b"
      # "qwen3.5:35b"
      # "gemma4:26b"
      # "qwen3.5:9b"
      # "qwen3-coder:30b"
      # "qwen3:e4b"
    ];
    # syncModels = true; #Synchronize all currently installed models with those declared in services.ollama.loadModels, removing any models that are installed but not currently declared there.

    openFirewall = true;
    host = "0.0.0.0";
    port = 11434;

    environmentVariables = {
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_NO_CLOUD = "1";
    };
  };
  services.nextjs-ollama-llm-ui = {
    enable = true;
    port = 3000;
    ollamaUrl = "http://localhost:11434";
  };
}
