# Home manager file
{ config, inputs, lib, pkgs, ... }: {
  programs.yazi = {
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;

    enable = true;
    enableZshIntegration = true;

    plugins = {
      inherit (pkgs.yaziPlugins) mount;
      compress = pkgs.yaziPlugins.compress;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      lazygit = pkgs.yaziPlugins.lazygit;
      recycle-bin = pkgs.yaziPlugins.recycle-bin;
      smart-enter = pkgs.yaziPlugins.smart-enter;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      starship = pkgs.yaziPlugins.starship;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
    };

    keymap = {
      mgr.prepend_keymap = [
        { run = "plugin lazygit"; on = [ "g" "i" ]; desc="Enter lazygit"; }
        { run = "plugin smart-enter"; on = [ "l" ]; desc="Smart enter"; }
        { run = "plugin recycle-bin"; on = [ "g" "b" ]; desc="Recycle bin"; }
        { run = "plugin smart-filter"; on = [ "F" ]; desc="Smart filter"; }
        { run = "plugin wl-clipboard"; on = [ "<C-y>" ]; desc="WL Clipboard"; }
        # Compress plugin
        { run = "plugin compress"; on = [ "c" "a" "a" ]; desc = "Archive selected files"; }
        { run = "plugin compress -p"; on = [ "c" "a" "p" ]; desc = "Archive selected files (password)"; }
        { run = "plugin compress -ph"; on = [ "c" "a" "h" ]; desc = "Archive selected files (password+header)"; }
        { run = "plugin compress -l"; on = [ "c" "a" "l" ]; desc = "Archive selected files (compression level)"; }
        { run = "plugin compress -phl"; on = [ "c" "a" "u" ]; desc = "Archive selected files (password+header+level)"; }
        # Extras
        { run = "shell -- dragon -x -i -T %h"; on = [ "<C-n>" ]; desc = "Drag and drop files"; }
        { run = "shell \"$SHELL\" --block"; on = [ "!" ]; desc = "Open $SHELL here"; }
      ];
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

      plugin = {
        prepend_fetchers = [
          {
            id  = "git";
            url = "*";
            run = "git";
          }
          {
            id  = "git";
            url = "*/";
            run = "git";
          }
        ];
      };
    };

    initLua = ./init.lua;
  };
} 