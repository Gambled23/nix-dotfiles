{ pkgs }:

pkgs.writeShellScriptBin "samisecuestro" ''
  #!${pkgs.bash}/bin/bash
  php artisan tinker
''


