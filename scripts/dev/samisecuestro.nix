{ pkgs }:

pkgs.writeShellScriptBin "dev_samisecuestro" ''
  #!${pkgs.bash}/bin/bash
  php artisan tinker --execute="\$user = App\Models\User::where('email', 'samuel.mercado@cucei.udg.mx')->first(); \$user->password = Hash::make('password'); \$user->save();"
  echo "Samuel Mercado ha sido secuestrado con éxito" | ${pkgs.clolcat}/bin/clolcat
''


