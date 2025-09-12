
# shellcheck disable=SC2155

# Add user-specific bin directories to PATH
export PATH="$HOME/.local/bin:$HOME/.local/bin/statusbar:$HOME/.local/share/npm/bin:$HOME/.local/share/nvim/mason/bin:$HOME/Notes/trash:$HOME/.local/share/go/bin:$PATH"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export TERMINAL_PROG="st"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"
export aurhelper="paru"

# XDG Base Directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ~/ Clean-up:

# Other & Clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/readline/inputrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME:-$HOME/.config}/java"
export QT_QPA_PLATFORMTHEME=qt5ct
export REMIND_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/remind"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wine"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export XAUTHORITY="${XDG_RUNTIME_DIR:-/run/user/"$(id -u)"}/Xauthority" # Remove if using a DM
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export UNISON="$XDG_DATA_HOME/unison"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# Other program settings:
export DICS="/usr/share/stardict/dic/"
export QT_SCALE_FACTOR=1.1
export MOZ_USE_XINPUT2="1"                # Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D" # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1      # Fix for Java applications in dwm

# Source Nix environment if it exists
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi
