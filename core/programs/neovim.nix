{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
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
      vim.assistant = {
        copilot = {
          enable = true;
          cmp.enable = true;
        };
      };
      vim.telescope.enable = true;
      vim.utility = {
        sleuth.enable = true;
        preview.markdownPreview.enable = true;
      };
      vim.minimap = {
        codewindow.enable = true;
        minimap-vim.enable = true;
      };
    };
  };
}
