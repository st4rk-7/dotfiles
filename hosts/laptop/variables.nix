{ config, lib, ... }:
{
  config.var = {
    hostname = "thinkpad";
    username = "st4rk";

    # Upgrade/GC opt-ins
    autoUpgrade = false;
    autoGarbageCollector = true;

    # NixOS config directory
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    # Git config
    git = {
      username = "st4rk";
      email = "st4rk.7@proton.me";
    };

    # Locale & Keyboard
    location = "Colombo";
    timeZone = "Asia/Colombo";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
