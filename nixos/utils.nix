{ pkgs, config, inputs, ... }:
let
  hostname = config.var.hostname;
  keyboardLayout = config.var.keyboardLayout;
  configDir = config.var.configDirectory;
  timeZone = config.var.timeZone;
  defaultLocale = config.var.defaultLocale;
  extraLocale = config.var.extraLocale;
  autoUpgrade = config.var.autoUpgrade;
in
{
  # Networking
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  # Nix Auto Upgrade
  system.autoUpgrade = {
    enable = autoUpgrade;
    dates = "01:00";
    flake = "${configDir}";
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
    allowReboot = false;
  };

  # Locale
  time = { timeZone = timeZone; };
  i18n.defaultLocale = defaultLocale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = extraLocale;
    LC_IDENTIFICATION = extraLocale;
    LC_MEASUREMENT = extraLocale;
    LC_MONETARY = extraLocale;
    LC_NAME = extraLocale;
    LC_NUMERIC = extraLocale;
    LC_PAPER = extraLocale;
    LC_TELEPHONE = extraLocale;
    LC_TIME = extraLocale;
  };

  # Services
  services = {
    gnome.gnome-keyring.enable = true;

    libinput.enable = true;

    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    udisks2.enable = true;

    psd = {
      enable = true;
      resyncTimer = "10m";
    };

    xserver = {
      enable = true;
      xkb.layout = keyboardLayout;
      xkb.variant = "";
    };

    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [ gcr gnome-settings-daemon ];
    };
  };
  console.keyMap = keyboardLayout;

  # Programs
  programs = {
    dconf.enable = true;
  };

  # Environment
  environment.pathsToLink = [ ];
  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    EDITOR = "nvim";
    TERMINAL = "ghostty";
    TERM = "ghostty";
    BROWSER = "zen-browser";
  };
  
  environment.systemPackages = with pkgs; [
    hyprland-qtutils
    xdg-utils

    fd
    bc
    wget
    curl

    gcc
    git-ignore
  ];

  # Documentation - Enables quicker rebuilding?
  documentation = {
    enable = true;

    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # XDG
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "gtk" "hyprland" ];
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Security
  security = {
    # Allows Wayland lockers to unlock the screen
    pam.services.hyprlock.text = "auth include login";

    # Userland niceness?
    rtkit.enable = true;

    # Don't ask for password if in the wheel group
    sudo.wheelNeedsPassword = false;

    # Enable Polkit
    polkit.enable = true;
  };

  # Don't shutdown when the power button is short-pressed
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';
}

















