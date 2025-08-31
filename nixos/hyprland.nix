{ inputs, pkgs, ... }:
{
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
  
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
