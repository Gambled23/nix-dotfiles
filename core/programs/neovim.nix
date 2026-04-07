{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.autocomplete = {
        enableSharedCmpSources = true;
        blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
          # sourcePlugins = [ "lsp" "path" "snippets" "buffer" ];
        };
      };

      vim.clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      vim.filetree = {
        nvimTree = {
          enable = true;
        };
      };

      vim.globals = {
        mapleader = " ";
        maplocalleader = ","; 
      };

      vim.lsp = {
        enable = true;
      };

      vim.languages = {
        enableFormat = true;
        enableTreesitter = true;

        nix.enable = true;
        python.enable = true;
        markdown.enable = true;
        html.enable = true;
        lua.enable = true;
        php.enable = true;
        bash.enable = true;
        css.enable = true;
        kotlin.enable = true;
        tailwind.enable = true;
        yaml.enable = true;
        ts.enable = true;
      };

      vim.spellcheck = {
        enable = true;
        languages = [ "en" ];
      };

      vim.notify = {
        nvim-notify.enable = true;
      };

      vim.telescope = {
        enable = true;
      };

      vim.theme = lib.mkForce {
        name = "gruvbox";
        style = "dark";
        transparent = true;
      };
      
      vim.treesitter = {
        enable = true;
        autotagHtml = true;
        context.enable = true;
        # fold = true;
        textobjects.enable = true;
      };

      vim.ui = {
        borders = {
          enable = true;
          globalStyle = "rounded";
          plugins.nvim-cmp.style = "rounded";
        };
        breadcrumbs.enable = true;
        colorful-menu-nvim.enable = true;
        colorizer.enable = true;
        smartcolumn.enable = true;
      };

      vim.utility = {
        sleuth.enable = true;
        preview.markdownPreview.enable = true;

        yazi-nvim = {
          enable = true;
        };
      };

      vim.visuals = {
        blink-indent.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        hlargs-nvim.enable = true;
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        rainbow-delimiters.enable = true;
      };
    };
  };
}