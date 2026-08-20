{ self, inputs, ... }: {
  flake.nixosModules.ollamaClient = { pkgs, ... }: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama;
      openFirewall = true;
      port = 11434;
      environmentVariables = {
        OLLAMA_HOST = "pc-gambled:11434";
        OLLAMA_NO_CLOUD = "1";
      };
    };
  };

  flake.nixosModules.ollamaServer = { pkgs, ... }: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm; # for AMD GPU support

      loadModels = [
        "gemma4:e4b"
      ];

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
  };
}
