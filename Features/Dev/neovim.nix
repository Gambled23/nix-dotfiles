{
  config,
  pkgs,
  lib,
  ...
}:
let
  noctalia_colors = import ../../Features/Ricing/Shells/Noctalia/Colors/nvf.nix;
in
{
  programs.nvf = {
    enable = true;
    settings = {
      # vim.assistant = {
      #   codecompanion-nvim = {
      #     enable = true;
      #   };
      # };
      vim.enableLuaLoader = true;
      
      # vim.autocmds = [
      #   {
      #     enable = true;
      #     callback = lib.generators.mkLuaInline ''
      #       function()
      #         if vim.bo.modified and vim.fn.expand("%") ~= "" then
      #           vim.cmd("silent! update")
      #         end
      #     '';
      #     desc = "Autocommand to autosave";
      #     event = [
      #       "InsertLeave"
      #       "TextChanged"
      #     ];
      #   }
      # ];
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

      vim.binds = {
        whichKey = {
          enable = true;
        };
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

      # vim.extraPlugins = with pkgs.vimPlugins; {
      #   vim-dadbod-ui = {
      #     package = vim-dadbod-ui;
      #   };
      # };

      vim.filetree = {
        # nvimTree = {
        #   enable = true;
        # };
        neo-tree = {
          enable = true;
        };
      };

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

      # vim.lazy = {
      #   enable = true;
      # };

      vim.languages = {
        enableFormat = true;
        enableTreesitter = true;

        bash.enable = true;
        css.enable = true;
        html.enable = true;
        json.enable = true;
        markdown.enable = true;
        nix.enable = true;
        python.enable = true;
        yaml.enable = true;
        # lua.enable = true;
        # php.enable = true;
        # kotlin.enable = true;
        # typescript.enable = true;
      };

      vim.lsp = {
        enable = true;
        presets = {
          tailwindcss-language-server.enable = true;
        };
      };

      # List of https://github.com/nvim-mini/mini.nvim
      vim.mini = {
        animate.enable = true;
        align.enable = true;
        bracketed.enable = true;
        clue.enable = true;
        cursorword.enable = true;
        comment.enable = true;
        hipatterns.enable = true;
        move.enable = true;
      };

      vim.minimap = {
        # minimap-vim.enable = true;
        # codewindow = {
        #   enable = true;
        # };
      };

      vim.notify = {
        nvim-notify = {
          enable = true;
          setupOpts = {
            background_colour = "#000000";
            timeout = 5000;
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
      
      vim.searchCase = "smart";

      vim.session = {
        nvim-session-manager = {
          enable = true;
        };
      };

      vim.spellcheck = {
        enable = true;
        languages = [ "en" ];
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

      vim.theme = lib.mkForce  {
        name = "base16";
        # style = "dark";
        transparent = true;
        base16-colors = {
          base00 = noctalia_colors.base00 or "#000000";
          base01 = noctalia_colors.base01 or "#1c1c1c";
          base02 = noctalia_colors.base02 or "#383838";
          base03 = noctalia_colors.base03 or "#545454";
          base04 = noctalia_colors.base04 or "#b8b8b8";
          base05 = noctalia_colors.base05 or "#d8d8d8";
          base06 = noctalia_colors.base06 or "#e8e8e8";
          base07 = noctalia_colors.base07 or "#f8f8f8";
          base08 = noctalia_colors.base08 or "#ab4646";
          base09 = noctalia_colors.base09 or "#dc9656";
          base0A = noctalia_colors.base0A or "#f7ca88";
          base0B = noctalia_colors.base0B or "#a1b56c";
          base0C = noctalia_colors.base0C or "#86c1b9";
          base0D = noctalia_colors.base0D or "#7cafc2";
          base0E = noctalia_colors.base0E or "#ba8baf";
          base0F = noctalia_colors.base0F or "#a16946";
        };
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
        modes-nvim.enable = true;
        nvim-ufo.enable = true;
        # smartcolumn.enable = true;
      };

      vim.undoFile = {
        enable = true;
      };

      vim.utility = {
        sleuth.enable = true;
        preview.markdownPreview.enable = true;
        surround.enable = true;
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
        # indent-blankline.enable = true;
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        rainbow-delimiters.enable = true;
      };
    };
  };
}
