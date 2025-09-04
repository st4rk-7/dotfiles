##
## ZSH Options
 
# Better completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History
#history
HISTSIZE=100000000
SAVEHIST=100000000
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"
export LESSHISTFILE=-

#timestamps
#HIST_STAMPS=yyyy/mm/dd

#options
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt inc_append_history  

# Autosuggestion
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"


command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Options
setopt append_history
setopt auto_cd
setopt extended_glob
setopt glob_dots
setopt interactive_comments
setopt menu_complete
setopt nomatch
unsetopt beep

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# vim:filetype=zsh:nowrap

