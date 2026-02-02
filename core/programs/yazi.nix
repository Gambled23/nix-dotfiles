# Home manager file
{ config, inputs, lib, pkgs, ... }: {
  programs.yazi = {
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;

    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    plugins = {
      inherit (pkgs.yaziPlugins) mount;
    };
  };
} 