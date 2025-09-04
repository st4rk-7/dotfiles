
# -----------------------------------------------------------------------------
# ## Editor Aliases
# -----------------------------------------------------------------------------
# Set neovim as the default editor.
export EDITOR='nvim'

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d --cmd ':lua vim.g.noplugins=1'"

# Edit config files
alias ce="confedit" # Assumes 'confedit' is a script/function in your path

# Edit files using fzf
alias fe="fzf-fd \$(pwd) | xargs -r nvim" # Find and edit file in current directory
alias be="fzf-fd \$HOME/.local/bin | xargs -r nvim" # Find and edit script in local bin

# Editor shortcuts
alias e="$EDITOR"
alias se="sudo $EDITOR"
alias vc='code' # VSCode

# Neovim with a specific configuration
alias based="NVIM_APPNAME=based nvim"


# -----------------------------------------------------------------------------
# ## System & Session Management
# -----------------------------------------------------------------------------
# Quick exit
alias q='exit'
alias x='exit'

# System control
alias sdn='sudo shutdown -h now'
alias lgout='systemctl suspend'
alias rs='sudo systemctl'
alias us='systemctl --user'
alias ka='killall'

# Clear terminal
alias c='clear'

# Source the zsh config to apply changes
alias reload='source ~/.config/zsh/.zshrc'

# Resource management
alias cleanram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias trim_all="sudo fstrim -va"

# Add sudo to common system commands
for command in mount umount pacman updatedb su shutdown poweroff reboot; do
  alias $command="sudo $command"
done
unset command

# Display system info
alias fch='fastfetch'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"


# -----------------------------------------------------------------------------
# ## File System & Navigation
# -----------------------------------------------------------------------------
# Parent directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias temp="cd /tmp/"

# 'eza' (a modern replacement for 'ls') aliases
alias ls='eza -1 --icons=auto'   # Short list
alias l='eza -lh --icons=auto'  # Long list, human-readable
alias ll='eza -lha --icons=auto --group-directories-first' # Long list, all files
alias lsa='eza -a --icons --group-directories-first' # Like ll but more compact
alias ld='eza -lhD --icons=auto' # Long list, directories only
alias lt='eza -T --icons=auto'   # Tree view
alias lst='eza -T --icons'      # Alias from aliarc, kept for muscle memory

# Safer and more informative file operations
alias cp='cp -ivr'
alias mv='mv -iv'
alias rm='rm -vrI' # Interactive prompt for more than three files
alias scp="scp -r"
alias chmd="chmod +x"

# Directory management
alias mkdir='mkdir -pv'
alias mkd='mkdir -pv' # Keep alias from aliarc

# File manager
alias fm='lf'
alias llf='lf' # Changed aliarc's 'll' to avoid conflict with eza

# View disk usage
alias dysk='dysk -u binary'
alias ncdu='ncdu --color dark'

# Archives
alias mtar='tar -zcvf'
alias utar='tar -zxvf'
alias uz='unzip'

# -----------------------------------------------------------------------------
# ## Package Management (Arch Linux)
# -----------------------------------------------------------------------------
# Set your preferred AUR helper
aurhelper='paru'

# System Updates
alias suu='$aurhelper -Syu' # Update system (pacman + AUR)
alias pacupd="pacman -Qu"   # Check for pacman updates
alias parupd="paru -Qua"    # Check for AUR updates

# Update mirrors and system
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && $aurhelper -Syyu --noconfirm'

# Package Installation
alias pr='$aurhelper -S'
alias pacin="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias paruin="$aurhelper -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro $aurhelper -S"

# Package Removal
alias prd='$aurhelper -Rns'
alias pacrem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

# Package Searching and Information
alias pa='$aurhelper -Ss' # Search for packages
alias pl='$aurhelper -Qs' # List installed packages
alias pac="pacman -Q | fzf" # Fuzzy find installed packages

# System Cleanup
alias pc='$aurhelper -Sc' # Clean unused cache
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq); $aurhelper -c' # Remove orphans and clean cache
alias cleanup="sudo pacman -Qtdq | sudo pacman -Rns -" # A simpler orphan remover

# Package Logs and Info
alias installed="grep -i installed /var/log/pacman.log"
alias parucom="paru -Gc"
alias parucheck="paru -Gp"

# Building from source
alias mke='sudo make install'


# -----------------------------------------------------------------------------
# ## Search (Grep, fzf, ag)
# -----------------------------------------------------------------------------
# General purpose searching with color
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias fgr="fzf-grep \$(pwd)"        # Grep in the current directory
alias cg="fzf-grep \$HOME/.config"  # Grep in config files

# The Silver Searcher (ag) with custom colors
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias aga="ag --hidden --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"


# -----------------------------------------------------------------------------
# ## Git & Version Control
# -----------------------------------------------------------------------------
# Dotfiles management alias
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias svn="svn --config-dir \"$XDG_CONFIG_HOME\"/subversion"

# Git short aliases
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git clone"
alias gcm="git commit -m"
alias gcs="git commit -S -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git difftool"
alias gdc="git difftool --cached"
alias gf="git fetch"
alias gg="git graph"
alias gm="git merge"
alias gp="git push"
alias gpr="gh pr create"
alias gr="git rebase -i"
alias gs="git status -sb"
alias gt="git tag"
alias gu="git reset @ --"  # Unstage
alias gx="git reset --hard @" # Hard reset


# -----------------------------------------------------------------------------
# ## Networking
# -----------------------------------------------------------------------------
# Colorized IP command
alias ip='ip -color=auto'

# Proxies
alias proxychains="proxychains -q"

# cURL with different user agents
alias curlh="curl -sILX GET"
alias curld="curl -A \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36\""
alias curlm="curl -A \"Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.12 Mobile/10B329 Safari/8536.25\""


# -----------------------------------------------------------------------------
# ## Media & General Utilities
# -----------------------------------------------------------------------------
# File viewing with bat (a modern cat)
alias cat="bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never"

# Youtube-DLp for video, audio, and MP3 conversion
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt-dlp -x -f bestaudio/best"
alias ytmp3="yt-dlp --ignore-errors -x --audio-format mp3 -f bestaudio --audio-quality 0 --embed-metadata --embed-thumbnail --output '%(title)s.%(ext)s'"

# Watch videos from command line
alias youtube="mov-cli -s youtube"

# FFmpeg with reduced output
alias ffmpeg="ffmpeg -hide_banner"

# Wallpaper setter
alias setbg="setbg ~/Pictures/Wallpapers"


# -----------------------------------------------------------------------------
# ## Development
# -----------------------------------------------------------------------------
# Android Debug Bridge
alias adb='HOME="$XDG_DATA_HOME"/android adb'

# Docker
alias doc="sudo docker"

# -----------------------------------------------------------------------------
# ## Zsh Specific Aliases (Suffix, Global)
# -----------------------------------------------------------------------------
# Suffix aliases (open file types with a specific program)
alias -s md=nvim
alias -s html=nvim

# Global aliases (can be used anywhere in a command line)
alias -g C="| $CLIPCOPY"  # Pipe to clipboard (ensure CLIPCOPY is defined)
alias -g F="| fpp -ko -nfc" # Pipe to Facebook PathPicker
alias -g G="| grep"
alias -g L="| wc -l"
alias -g Q="&& exit"
alias -g Z="| fzf"
alias -g wcc="| wc -m"
alias -g wcw="| wc -w"
alias -g gre="grep -inr"

# vim:ft=zsh
