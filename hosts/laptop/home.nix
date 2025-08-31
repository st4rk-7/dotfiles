{ pkgs, lib, config, ... }:
{
    imports = [
        # User Specific Config
        ./variables.nix

        # System
        ../../home/system/hyprland
        ../../home/system/hypridle
        ../../home/system/hyprlock
        ../../home/system/cursor
        ../../home/system/fish-shell
        ../../home/system/neofetch
        ../../home/system/git
        ../../home/system/java

        # Programs
        ../../home/programs/discord
        ../../home/programs/ghostty
        ../../home/programs/spicetify

        # Shell
        ../../home/quickshell
    ];

    home = {
        # Set the home directory path for our user
        inherit (config.var) username;
        homeDirectory = "/home/" + config.var.username;

        # Packages
        packages = with pkgs; [
            # Apps
            brave

            # Development - Languages/Tools
            premake5
            nodejs
            python3

            # Development - IDE
            vscode

            # Utilities
            grc
            zip
            unzip
            tree
            btop
            fish
            neofetch
            gtk3

            # Misc
            cava
            bluez
            ddcutil
            brightnessctl
            imagemagick
        ];

        # State version - don't touch this
        stateVersion = "24.11";
    };

    # Enable Home Manager
    programs.home-manager = {
        enable = true;
    };
}
