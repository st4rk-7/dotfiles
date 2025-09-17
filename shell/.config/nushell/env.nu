# ~/.config/nushell/env.nu
#
# Nushell Environment Configuration
# Sets up XDG directories, default programs, tool configurations, and your PATH.

# 1. XDG Base Directory Standard
$env.XDG_CACHE_HOME = ($env.HOME | path join ".cache")
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.XDG_DATA_HOME = ($env.HOME | path join ".local/share")
$env.XDG_STATE_HOME = ($env.HOME | path join ".local/state")
$env.XDG_SCREENSHOTS_DIR = ($env.HOME | path join "Pictures/screenshots")

# 2. Default Programs
$env.EDITOR = "nvim"
$env.TERMINAL = "st"
$env.BROWSER = "firefox"
$env.aurhelper = "paru"

# 3. PATH Configuration
use std "path add"
path add ($env.HOME | path join ".local/bin")
path add ($env.HOME | path join ".local/bin/statusbar")
path add ($env.HOME | path join ".local/share/npm/bin")
path add ($env.HOME | path join ".local/share/nvim/mason/bin")
path add ($env.HOME | path join "Notes/trash")
path add ($env.HOME | path join ".local/share/go/bin")

# 4. Tool-Specific Environment

# --- FZF (Fuzzy Finder) Behavior ---
# Corrected: Use string concatenation to build the command safely and avoid parser errors.
let fzf_base_command = 'find ' + $env.HOME + " -type f | grep -vE '/(.git|node_modules|target|__pycache__)/'"
$env.FZF_DEFAULT_COMMAND = $fzf_base_command
$env.FZF_CTRL_T_COMMAND = $fzf_base_command
$env.FZF_ALT_C_COMMAND = 'find ' + $env.HOME + " -type d | grep -vE '/(.git|node_modules|target|__pycache__)/'"
$env.FZF_ALT_C_OPTS = "--preview 'tree -C {} | head -200'"

# --- Bat (cat clone) ---
$env.BAT_THEME = "Catppuccin-Mocha"


# 5. Application & System Environment Variables
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config/starship.toml")
$env.SUDO_ASKPASS = ($env.HOME | path join ".local/bin/dmenupass")
$env.DBUS_SESSION_BUS_ADDRESS = $"unix:path=/run/user/(id -u)/bus"
$env.GNUPGHOME = ($env.XDG_DATA_HOME | path join "gnupg")
$env.GTK2_RC_FILES = ($env.XDG_CONFIG_HOME | path join "gtk-2.0/gtkrc")
$env.INPUTRC = ($env.XDG_CONFIG_HOME | path join "readline/inputrc")
$env.PASSWORD_STORE_DIR = ($env.XDG_DATA_HOME | path join "pass")
$env.WINEPREFIX = ($env.XDG_DATA_HOME | path join "wine")
$env.XINITRC = ($env.XDG_CONFIG_HOME | path join "x11/xinitrc")
$env.NOTMUCH_CONFIG = ($env.XDG_CONFIG_HOME | path join "notmuch-config")
$env.WGETRC = ($env.XDG_CONFIG_HOME | path join "wget/wgetrc")
$env.TMUX_TMPDIR = $env.XDG_RUNTIME_DIR
$env.ANDROID_SDK_HOME = ($env.XDG_CONFIG_HOME | path join "android")
$env.CARGO_HOME = ($env.XDG_DATA_HOME | path join "cargo")
$env.GOPATH = ($env.XDG_DATA_HOME | path join "go")
$env.GOMODCACHE = ($env.XDG_CACHE_HOME | path join "go/mod")
$env.ANSIBLE_CONFIG = ($env.XDG_CONFIG_HOME | path join "ansible/ansible.cfg")
$env.UNISON = ($env.XDG_DATA_HOME | path join "unison")
$env.MBSYNCRC = ($env.XDG_CONFIG_HOME | path join "mbsync/config")
$env.PYTHONSTARTUP = ($env.XDG_CONFIG_HOME | path join "python/pythonrc")
$env.SQLITE_HISTORY = ($env.XDG_DATA_HOME | path join "sqlite_history")
$env.TERMINFO = ($env.XDG_DATA_HOME | path join "terminfo")
$env.NPM_CONFIG_USERCONFIG = ($env.XDG_CONFIG_HOME | path join "npm/npmrc")
$env._JAVA_OPTIONS = $"-Djava.util.prefs.userRoot=($env.XDG_CONFIG_HOME)/java"
$env.QT_QPA_PLATFORMTHEME = "gtk2"
$env.QT_SCALE_FACTOR = 1.1
$env.MOZ_USE_XINPUT2 = "1"
$env.AWT_TOOLKIT = "MToolkit wmname LG3D"
$env._JAVA_AWT_WM_NONREPARENTING = "1"
$env.LESSHISTFILE = "-"