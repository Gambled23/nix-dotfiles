{ pkgs }:

pkgs.writeShellScriptBin "noctalia-update-config" ''
  #!${pkgs.bash}/bin/bash

  input_file="$1"

  if [[ -z "$input_file" ]]; then
    echo "Usage: noctalia-update-config <path_to_noctalia.nix>"
    exit 1
  fi

  if [[ ! -f "$input_file" ]]; then
    echo "Error: File $input_file not found."
    exit 1
  fi

  out_dir="/etc/nixos/Features/Ricing/Shells/Noctalia/Config"

  shopt -s nullglob
  for out_file in "$out_dir"/*.nix; do
    basename=$(basename "$out_file" .nix)
    conf_key="''${basename//-/_}"
    
    # Extract block
    block=$(awk -v conf="$conf_key" 'BEGIN{flag=0; pattern="^\t" conf " = \\{"} $0 ~ pattern {flag=1} flag{print} /^\t\};/{if(flag){flag=0; exit}}' "$input_file")
    
    if [[ -n "$block" ]]; then
      formatted_block=$(printf '%s\n' "$block" | sed 's/^\t//' | expand -t 2 | sed 's/^/    /' | sed -E 's/^([ \t]*)([^" \t]+@[^" \t]+)([ \t]*=)/\1"\2"\3/')

      awk -v new_block="$formatted_block" -v conf="$conf_key" '
      BEGIN { in_block=0; brace_count=0 }
      in_block == 0 {
          if ($0 ~ "^[ \t]*" conf "[ \t]*=[ \t]*\\{") {
              in_block=1
              print new_block
              brace_count = 1
          } else {
              print $0
          }
          next
      }
      in_block == 1 {
          line = $0
          gsub(/[^\{]/, "", line)
          open_braces = length(line)
          
          line = $0
          gsub(/[^\}]/, "", line)
          close_braces = length(line)
          
          brace_count += open_braces - close_braces
          
          if (brace_count <= 0) {
              in_block = 0
          }
      }' "$out_file" > "$out_file.tmp" && mv "$out_file.tmp" "$out_file"
      echo "Updated $out_file"
    else
      echo "Skipped $out_file (not found in $input_file)"
    fi
  done
''