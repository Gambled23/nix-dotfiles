{ config, pkgs, lib, ... }:

{
  # MariaDB server
  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
      # initialDatabases =[
      #   { name = "databasa"; }
      # ];
      # ensureUsers= [
      #   {
      #     name = "root";
      #     ensurePermissions = {
      #       "*.*" = "SELECT, LOCK TABLES";
      #     };
      #   }
      # ];
    };
  };
}
