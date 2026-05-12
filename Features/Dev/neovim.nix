{
  config,
  pkgs,
  lib,
  ...
}:
let
  noctalia_color_file = builtins.readFile ../../Features/Ricing/noctalia_colors/nvf.ini;
  lines = builtins.split "\n" noctalia_color_file;
  kvs = builtins.filter (x: x != null)
    (map (line:
      let m = builtins.match "^[ \\t]*([A-Za-z0-9_]+)[ \\t]*=[ \\t]*#?([A-Fa-f0-9]{6})" line;
      in if m == null then null else { name = m[1]; value = m[2]; })
    lines);
  normalize = val:
    if val == null then null
    else if builtins.substring 0 1 val == "#" then val
    else "#" + val;
  colors = builtins.listToAttrs (map (e: { name = e.name; value = normalize e.value; }) (builtins.filter (e: e.value != null) kvs));
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
      #   base16 = {
      #     package = base16-nvim;
      #     setup = "require('matugen').setup {}";
      #   };
      # };

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
        presets = {
          tailwindcss-language-server.enable = true;
        };
      };

      vim.languages = {
        enableFormat = true;
        enableTreesitter = true;

        nix.enable = true;
        python.enable = true;
        html.enable = true;
        bash.enable = true;
        css.enable = true;
        yaml.enable = true;
        # markdown.enable = true;
        # lua.enable = true;
        # php.enable = true;
        # kotlin.enable = true;
        # typescript.enable = true;
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
        name = "base16";
        # style = "dark";
        transparent = true;
        base16-colors = {
          base00 = colors.base00 or "#000000";
          base01 = colors.base01 or "#1c1c1c";
          base02 = colors.base02 or "#383838";
          base03 = colors.base03 or "#545454";
          base04 = colors.base04 or "#b8b8b8";
          base05 = colors.base05 or "#d8d8d8";
          base06 = colors.base06 or "#e8e8e8";
          base07 = colors.base07 or "#f8f8f8";
          base08 = colors.base08 or "#ab4646";
          base09 = colors.base09 or "#dc9656";
          base0A = colors.base0A or "#f7ca88";
          base0B = colors.base0B or "#a1b56c";
          base0C = colors.base0C or "#86c1b9";
          base0D = colors.base0D or "#7cafc2";
          base0E = colors.base0E or "#ba8baf";
          base0F = colors.base0F or "#a16946";
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
        smartcolumn.enable = true;
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
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        rainbow-delimiters.enable = true;
      };
    };
  };
}
