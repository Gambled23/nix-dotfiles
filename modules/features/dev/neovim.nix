{ self, inputs, ... }: {
  flake.homeModules.neovim = { pkgs, lib, ... }: let
    noctalia_colors = import ../ricing/shells/noctalia/_Colors/nvf.nix;
  in {
    imports = [
      inputs.nvf.homeManagerModules.default
    ];

    programs.nvf = {
      enable = true;
      settings = {
        vim.assistant = {
          codecompanion-nvim = {
            enable = true;
          };
        };
        vim.enableLuaLoader = true;
        
        vim.autocomplete = {
          enableSharedCmpSources = true;
          blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
          };
        };
        
        vim.autopairs = {
          nvim-autopairs.enable = true;
        };

        vim.binds = {
          cheatsheet.enable = true;
          hardtime-nvim.enable = true;
          whichKey = {
            enable = true;
          };
        };

        vim.clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          providers.xclip.enable = true;
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

        vim.extraPlugins = with pkgs.vimPlugins; {
          barbar-nvim = {
            package = barbar-nvim;
          };
        };

        vim.filetree = {
          neo-tree = {
            enable = true;
          };
        };

        vim.git = {
          enable = true;
        };

        vim.globals = {
          mapleader = " ";
          maplocalleader = ","; 
        };

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
        };

        vim.lsp = {
          enable = true;
          presets = {
            tailwindcss-language-server.enable = true;
          };
        };

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
            setupOpts.manual_mode = false;
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
            integrations.breadcrumbs.nvim-navic.enable = true;
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
          transparent = true;
          base16-colors = {
            base00 = noctalia_colors.base00;
            base01 = noctalia_colors.base01;
            base02 = noctalia_colors.base02;
            base03 = noctalia_colors.base03;
            base04 = noctalia_colors.base04;
            base05 = noctalia_colors.base05;
            base06 = noctalia_colors.base06;
            base07 = noctalia_colors.base07;
            base08 = noctalia_colors.base08;
            base09 = noctalia_colors.base09;
            base0A = noctalia_colors.base0A;
            base0B = noctalia_colors.base0B;
            base0C = noctalia_colors.base0C;
            base0D = noctalia_colors.base0D;
            base0E = noctalia_colors.base0E;
            base0F = noctalia_colors.base0F;
          };
        };
        
        vim.treesitter = {
          enable = true;
          autotagHtml = true;
          context.enable = true;
          textobjects.enable = true;
        };

        vim.ui = {
          borders = {
            enable = true;
            globalStyle = "rounded";
            plugins.nvim-cmp.style = "rounded";
          };
          colorful-menu-nvim.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = true;
          nvim-ufo.enable = true;
          nvim-ufo.setupOpts = {
            foldcolumn = 1;
            foldlevel = 1;
            foldlevelstart = 1;
            foldenable = true;
          };
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
  };
}
