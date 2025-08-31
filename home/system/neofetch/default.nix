{ config, lib, pkgs, ... }:
{
  xdg.configFile = {
    "neofetch/config.conf" = {
      source = ./themes/rem/config.conf;
    };
    "neofetch/rem.png" = {
      source = ./themes/rem/rem.png;
    };
  };
}