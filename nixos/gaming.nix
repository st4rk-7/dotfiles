{ inputs, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        bottles
        
        mangohud
        protonup
    ];

    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
}
