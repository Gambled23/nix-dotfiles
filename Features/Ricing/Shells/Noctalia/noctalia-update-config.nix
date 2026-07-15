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
      # Write to target file
      {
        echo "{ pkgs, config, lib, ... }:"
        echo "{"
        echo "  programs.noctalia.settings = {"
        printf '%s\n' "$block"
        echo "  };"
        echo "}"
      } > "$out_file"
      echo "Updated $out_file"
    else
      echo "Skipped $out_file (not found in $input_file)"
    fi
  done
''