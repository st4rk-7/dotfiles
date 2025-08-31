{ config, ... }:
let
  animationSpeed = "1.0";
in
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
    };
  };
}

