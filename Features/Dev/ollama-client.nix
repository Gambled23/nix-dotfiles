{ config, lib, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama; #for amd gpu support

    openFirewall = true;
    # host = "10.243.0.2";
    port = 11434;
    environmentVariables = {
      OLLAMA_HOST = "10.243.0.2:11434";
      OLLAMA_NO_CLOUD = "1";
    };
  };
}
