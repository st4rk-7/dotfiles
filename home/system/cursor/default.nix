{ pkgs, lib, ... }:
{
  home.pointerCursor = {
    hyprcursor.enable = true;
    hyprcursor.size = 14;

    package = pkgs.phinger-cursors;

    enable = true;
    gtk.enable = true;
    x11.enable = true;

    name = "phingers-cursors-light";
    size = 14;
  };
}
