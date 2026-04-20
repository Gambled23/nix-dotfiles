# Home manager file
{ config, inputs, lib, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    plugins = {
      inherit (pkgs.yaziPlugins) mount;
      compress = pkgs.yaziPlugins.compress;
      drag = pkgs.yaziPlugins.drag;
      duckdb = pkgs.yaziPlugins.duckdb;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      gvfs = pkgs.yaziPlugins.gvfs;
      lazygit = pkgs.yaziPlugins.lazygit;
      recycle-bin = pkgs.yaziPlugins.recycle-bin;
      smart-enter = pkgs.yaziPlugins.smart-enter;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      smart-paste = pkgs.yaziPlugins.smart-paste;
      starship = pkgs.yaziPlugins.starship;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
    };

    keymap = {
      mgr.prepend_keymap = [
        { run = "plugin drag"; on = [ "<C-d>" ]; desc="Drag files"; }
        { run = "plugin lazygit"; on = [ "g" "i" ]; desc="Enter lazygit"; }
        { run = "plugin recycle-bin"; on = [ "g" "b" ]; desc="Recycle bin"; }
        { run = "plugin smart-enter"; on = [ "l" ]; desc="Smart enter"; }
        { run = "plugin smart-filter"; on = [ "F" ]; desc="Smart filter"; }
        { run = "plugin smart-paste"; on = [ "p" ]; desc="Paste into the hovered directory or CWD"; }
        { run = "plugin wl-clipboard"; on = [ "<C-y>" ]; desc="WL Clipboard"; }
        # Compress plugin
        { run = "plugin compress"; on = [ "c" "a" "a" ]; desc = "Archive selected files"; }
        { run = "plugin compress -p"; on = [ "c" "a" "p" ]; desc = "Archive selected files (password)"; }
        { run = "plugin compress -ph"; on = [ "c" "a" "h" ]; desc = "Archive selected files (password+header)"; }
        { run = "plugin compress -l"; on = [ "c" "a" "l" ]; desc = "Archive selected files (compression level)"; }
        { run = "plugin compress -phl"; on = [ "c" "a" "u" ]; desc = "Archive selected files (password+header+level)"; }
        # gvfs plugin
        { run = "plugin gvfs -- select-then-mount --jump"; on = [ "M" "m" ]; desc = "Select device to mount and jump to its mount point"; }
        { run = "plugin gvfs -- remount-current-cwd-device"; on = [ "M" "R" ]; desc = "Remount device under cwd"; }
        { run = "plugin gvfs -- select-then-unmount --eject"; on = [ "M" "u" ]; desc = "Select device then eject"; }
        { run = "plugin gvfs -- add-mount"; on = [ "M" "a" ]; desc = "Add a GVFS mount URI"; }
        { run = "plugin gvfs -- edit-mount"; on = [ "M" "e" ]; desc = "Edit a GVFS mount URI"; }
        { run = "plugin gvfs -- remove-mount"; on = [ "M" "r" ]; desc = "Remove a GVFS mount URI"; }
        { run = "plugin gvfs -- jump-to-device --automount"; on = [ "g" "m" ]; desc = "Automount then select device to jump to its mount point"; }
        { run = "plugin gvfs -- jump-back-prev-cwd"; on = [ "`" "`" ]; desc = "Jump back to the position before jumped to device"; }
        { run = "plugin gvfs -- automount-when-cd"; on = [ "M" "t" ]; desc = "Enable automount when cd to device under cwd"; }
        { run = "plugin gvfs -- automount-when-cd --disabled"; on = [ "M" "T" ]; desc = "Disable automount when cd to device under cwd"; }
        # duckdb plugin
        { run = "plugin duckdb -1"; on = [ "H" ]; desc="Scroll one column to the left"; }
        { run = "plugin duckdb +1"; on = [ "L" ]; desc="Scroll one column to the right"; }
        { run = "plugin duckdb -ui"; on = [ "g" "u" ]; desc="Open with duckdb ui"; }
        { run = "plugin duckdb -open"; on = [ "g" "o" ]; desc="Open with duckdb"; }

        # Extras
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
        prepend_previewers = [
          { name = "*.csv"; run = "duckdb"; }  
          { name = "*.tsv"; run = "duckdb"; }  
          { name = "*.json"; run = "duckdb"; }  
          { name = "*.parquet"; run = "duckdb"; }  
          { name = "*.txt"; run = "duckdb"; }  
          { name = "*.xlsx"; run = "duckdb"; }  
          { name = "*.db"; run = "duckdb"; }
          { name = "*.duckdb"; run = "duckdb"; }
        ];
        prepend_preloaders = [
          { name = "*.csv"; run = "duckdb"; multi = false; }  
          { name = "*.tsv"; run = "duckdb"; multi = false; }  
          { name = "*.json"; run = "duckdb"; multi = false; }  
          { name = "*.parquet"; run = "duckdb"; multi = false; }
          { name = "*.txt"; run = "duckdb"; multi = false; }  
          { name = "*.xlsx"; run = "duckdb"; multi = false; }
        ];
      };
    };

    initLua = ./init.lua;
  };
} 