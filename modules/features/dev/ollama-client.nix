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
}
