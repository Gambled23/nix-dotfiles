{ pkgs }:

pkgs.writeShellScriptBin "flash-kernelsu" ''
  #!${pkgs.bash}/bin/bash

  # Download init_boot,img
  ota_link=$(curl -s -b "devsite_wall_acks=nexus-ota-tos" "https://developers.google.com/android/ota" \
    | tr -d '\n' \
    | sed 's/<tr/\n<tr/g' \
    | grep 'id="komodo' \
    | sed -E 's/.*<td>([^<]+)<\/td>.*(https:\/\/dl\.google\.com\/dl\/android\/aosp\/komodo-ota-[^"]+\.zip).*/\1 | \2/' \
    | tail -n 10 \
    | tac \
    | ${pkgs.gum}/bin/gum choose --header "Select version" --label-delimiter=" | ")
  $(${pkgs.uv}/bin/uv tool run --from android-payload-dumper payload-dumper "$ota_link" -p init_boot)

  android_kdeconnect_id=add58a14_05d3_43a6_821f_d741a767cf5e
  ${pkgs.gum}/bin/gum spin --spinner dot --title "Enviando a Android" -- kdeconnect-cli --device $android_kdeconnect_id --share ./output/init_boot.img
  
  read -p "Press [Enter] key after sending init_boot patched image..."
  rm -r --force output
  init_boot=$(${pkgs.gum}/bin/gum file $HOME/Downloads/)
  adb reboot fastboot
 
  fastboot flash init_boot $init_boot
  fastboot reboot
''
