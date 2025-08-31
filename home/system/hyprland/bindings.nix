{ pkgs, ... }:
let
  totalWorkspaces = 9;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Kill active window
      "$mod, Q, killactive"

      # Bindings to open applications
      "$mod, C, exec, code"         # Open VS Code
      "$mod, SPACE, exec, ghostty"  # Open Ghostty terminal
      "$mod, W, exec,zen-browser "      #zen-browser

      # Screenshot with hyprshot
      "$mod, Print, exec, ~/.config/nixos/home/system/hyprland/scripts/hyprshot.sh region"
      "$shiftMod, Print, exec, ~/.config/nixos/home/system/hyprland/scripts/hyprshot.sh monitor"

      # Caelestia shell bindings
      "$mod, RETURN, exec, caelestia-quickshell shell toggle launcher"
      "$mod, D, exec, caelestia-quickshell shell toggle dashboard"
      "$mod, S, exec, caelestia-quickshell shell toggle session"
    ] ++ ( builtins.concatLists(builtins.genList (i:
      let ws = i + 1;
      in [
        "$mod, code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
      ]) totalWorkspaces
    ));
  };
}
