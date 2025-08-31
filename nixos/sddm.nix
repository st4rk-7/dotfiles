{ pkgs, inputs, config, lib, ... }:
let
  foreground = config.theme.textColorOnWallpaper;
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  };
in
{
  services.displayManager = {
    sddm = {
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs.kdePackages; [
        # sddm-astronaut
        qtsvg
        qtmultimedia
        qtvirtualkeyboard
      ];
 
      enable = true;
      wayland.enable = true;

      enableHidpi = true;

      theme = "sddm-astronaut-theme";

      settings = {
        Wayland.SessionDir = "${inputs.hyprland.packages."${pkgs.system}".hyprland}/share/wayland-sessions";
      };
    };
  };

  environment.systemPackages = [ sddm-astronaut ];

  # Prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
