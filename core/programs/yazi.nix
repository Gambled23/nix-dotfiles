# Home manager file
{ lib, inputs, ... }: {
  
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

} 