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
      
      vim.autopairs = {
        nvim-autopairs.enable = true;
      };

      vim.clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      vim.dashboard = {
        alpha.enable = true;
        alpha.theme = "startify";
      };

      vim.diagnostics = {
        enable = true;
        config = {
          virtual_lines = { current_line = true; };
          virtual_text = true;
          update_in_insert = true;
          underline = true;
        };
      };

      vim.debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
          ui.autoStart = true;
        };
      };

      # vim.filetree = {
      #   nvimTree = {
      #     enable = true;
      #   };
      # };

      # vim.gestures = {
      #   gesture-nvim.enable = true;
      # };

      vim.git = {
        enable = true;
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

      # List of https://github.com/nvim-mini/mini.nvim
      vim.mini = {
        animate.enable = true;
        bracketed.enable = true;
        clue.enable = true;
        cursorword.enable = true;
        comment.enable = true;
        move.enable = true;
      };

      vim.minimap = {
        minimap-vim.enable = true;
      };

      vim.notify = {
        nvim-notify = {
          enable = true;
          setupOpts = {
            background_color = "#000000";
            timeout = 3000;
          };
        };
      };

      vim.presence = {
        neocord.enable = true;
      };

      vim.projects = {
        project-nvim = {
          enable = true;
        };
      };

      vim.runner = {
        run-nvim.enable = true;
      };

      vim.session = {
        nvim-session-manager = {
          enable = true;
        };
      };
      
      vim.statusline = {
        lualine = {
          enable = true;
        };
      };

      vim.telescope = {
        enable = true;
      };

      vim.terminal = {
        toggleterm = {
          enable = true;
          mappings.open = "<leader>j";
          lazygit = {
            enable = true;
          };
        };
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

      vim.undoFile = {
        enable = true;
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
        # nvim-scrollbar.enable = true;
        rainbow-delimiters.enable = true;
      };
    };
  };
}
