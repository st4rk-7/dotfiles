# fish
set -U fish_color_autosuggestion "#737373"
set -U zoxide_cmd z


# history files
set -gx HISTFILE $ZDOTDIR/.zsh_history
set -gx HISTSIZE 1000000
set -gx SAVEHIST 1000000
set -gx WORDCHARS '*?_-.[]~=&;!#$%^(){}<>' # For shell word boundaries

# Use bat as less
set -x LESSOPEN "|/usr/bin/batpipe %s";
set -e LESSCLOSE;
set -x LESS "$LESS -R";
set -x BATPIPE "color";
set -gx LESSHISTFILE "-" # Disable less history file

# FZF
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --exclude .git'
set -gx BAT_THEME "Catppuccin-mocha"
set -gx FZF_DEFAULT_OPTS \
  "--height=50%" \
  "--reverse" \
  "--prompt=' '" \
  "--pointer=''" \
  "--ellipsis='…'" \
  "--color=bg+:#2d3f76" \
  "--color=bg:#1e2030" \
  "--color=border:#589ed7" \
  "--color=fg:#c8d3f5" \
  "--color=gutter:#1e2030" \
  "--color=header:#ff966c" \
  "--color=hl+:#65bcff" \
  "--color=hl:#65bcff" \
  "--color=info:#545c7e" \
  "--color=marker:#ff007c" \
  "--color=pointer:#ff007c" \
  "--color=prompt:#65bcff" \
  "--color=query:#c8d3f5:regular" \
  "--color=spinner:#ff007c"

# Interactive tools settings
set -gx SUDO_ASKPASS "$HOME/.local/bin/dmenupass"
set -gx LESS_TERMCAP_mb (printf '%b' '\e[1;31m')
set -gx LESS_TERMCAP_md (printf '%b' '\e[1;36m')
set -gx LESS_TERMCAP_me (printf '%b' '\e[0m')
set -gx LESS_TERMCAP_so (printf '%b' '\e[01;44;33m')
set -gx LESS_TERMCAP_se (printf '%b' '\e[0m')
set -gx LESS_TERMCAP_us (printf '%b' '\e[1;32m')
set -gx LESS_TERMCAP_ue (printf '%b' '\e[0m')

# sudo prompt
set -gx SUDO_PROMPT (string join '' \
    (tput bold) (tput setaf 1) '' \
    (tput setab 1) (tput setaf 0) 'sudo' (tput sgr0) \
    (tput bold) (tput setaf 1) ' ' \
    (tput setaf 7) 'password for %u: ' (tput sgr0))

# Editor
set -gx EDITOR 'nvim'

# AUR Helper
set -gx aurhelper 'paru'
