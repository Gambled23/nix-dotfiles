# Home manager file
{ config, inputs, lib, pkgs, ... }: {
  programs.yazi = {
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;

    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    plugins = {
      inherit (pkgs.yaziPlugins) mount;
      lazy-git = pkgs.yaziPlugins.lazygit;
      git = pkgs.yaziPlugins.git;
    };

    settings = {
      yazi = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };
    };
  };
} 