################################################################################
#                                                                              #
#                        FISH SHELL CONFIGURATION                              #
#                                                                              #
#   - Functions are defined first for clarity.                                 #
#   - Aliases are grouped by category for easy maintenance.                    #
#                                                                              #
################################################################################


# =============================================================================
# >> CUSTOM FUNCTIONS
# =============================================================================
# Complex logic and multi-command scripts are best handled by functions.

# Pre-authorize sudo before command execution to avoid password prompt mid-command.
function sudo
    command sudo -v
    command sudo $argv
end

# A wrapper for the yazi file manager to change directory on exit.
function r
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Upload a file using ffsend, display a QR code, and copy the URL to the clipboard.
function ffsend
  set url (/usr/bin/ffsend upload -q "$argv")
  qrencode -t UTF8 $url
  echo "Copied to clipboard: $url"
  wl-copy "$url"
end

# Wrapper for paru to first show important updates, then run a full system upgrade.
function uppac
    printf '%b\n' "\e[32m:: \e[0mImportant updates:"
    checkupdates | grep -Ff ~/.config/paru/important_packages.txt
    echo
    paru
end

# Get system serial number (e.g., for Dell support) and copy to clipboard.
function esupport
    set ESUPPORT (sudo dmidecode -t system | grep Serial | sed 's/.*:\ //g')
    echo $ESUPPORT | wl-copy
    echo "Copied to clipboard: $ESUPPORT"
end

# Clone a specific branch from the Arch Linux AUR repository.
function dpkgb
    git clone --branch "$argv[1]" --single-branch https://github.com/archlinux/aur.git "$argv[1]"
end

# Rate Arch mirrors, backup the old mirrorlist, and perform a full system update.
function ua-update-all
    set TMPFILE (mktemp)
    sudo true
    rate-mirrors --save=$TMPFILE arch --max-delay=21600
    and sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
    and sudo mv $TMPFILE /etc/pacman.d/mirrorlist
    and $aurhelper -Syyu --noconfirm
end


# =============================================================================
# >> ALIASES
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Navigation & Directory Management
# -----------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias temp="cd /tmp/"
alias acvpip="source .venv/bin/activate" # Activate Python virtual environment

# -----------------------------------------------------------------------------
# 2. File & Directory Operations
# -----------------------------------------------------------------------------
alias cp 'cp -ivr'      # Copy with interactive prompt and verbose output
alias mv 'mv -iv'       # Move with interactive prompt and verbose output
alias rm='rm -i'        # Always prompt before removing
alias mkdir 'mkdir -pv' # Create parent directories and show what was created
alias mkd 'mkdir -pv'
alias chmd "chmod +x"   # Make a file executable
alias scp "scp -r"
alias mtar 'tar -zcvf'  # Create a gzipped tar archive
alias utar 'tar -zxvf'  # Extract a gzipped tar archive
alias uz 'unzip'

# -----------------------------------------------------------------------------
# 3. System & Process Management
# -----------------------------------------------------------------------------
# Sudo Wrappers / Privilege Escalation
alias pacman "sudo pacman"
alias mount "sudo mount"
alias umount "sudo umount"
alias updatedb "sudo updatedb"
alias su "sudo su"
alias sd "sudo shutdown"
alias poweroff "sudo poweroff"
alias reboot "sudo reboot"

# System Control
alias sdn 'sudo shutdown -h now'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias uefi='systemctl reboot --firmware-setup'
alias lgout='systemctl suspend' # Custom suspend command
alias rs 'sudo systemctl'
alias us 'systemctl --user'

# Process & Resource Management
alias psg "ps -u (whoami) -o pid,vsz,rss,comm | sort -k 2 -hr" # Greppable process list
alias ka 'killall'
alias cleanram "sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias trim_all "sudo fstrim -va"
alias sensors "sensors | sed 's/.*hwmon.*/Wi-fi adapter:/g; s/.*k10.*/CPU:/g; s/amdgpu.*/GPU:/g; s/nvme.*/SSD:/g; s/vddgfx/GFX Core Voltage/g; s/vddnb/NB Voltage/g;'"

# -----------------------------------------------------------------------------
# 4. Package Management (Pacman & Paru)
# -----------------------------------------------------------------------------
alias suu "$aurhelper -Syu" # Full system upgrade including AUR
alias pr "$aurhelper -S"    # Install packages
alias prd "$aurhelper -Rns" # Remove packages with dependencies
alias pa "$aurhelper -Ss"   # Search for packages
alias pl "$aurhelper -Qs"   # List installed packages
alias pc "$aurhelper -Sc"   # Clean cache

# Interactive fzf-based package management
alias pacin "pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias paruin "$aurhelper -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro $aurhelper -S"
alias pacrem "pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

# Package Cleanup
alias cleanpac 'sudo pacman -Rns (pacman -Qtdq); and $aurhelper -c'
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias cleanup "sudo pacman -Qtdq | sudo pacman -Rns -"

# Package Info
alias pacupd "pacman -Qu"     # Check for official repo updates
alias parupd "paru -Qua"      # Check for AUR updates
alias findpac='sudo pacman -Qs'
alias lspac='pacman -Qqe'
alias installed "grep -i installed /var/log/pacman.log"
alias parucom "paru -Gc"      # Check Paru configuration
alias parucheck "paru -Gp"    # Check Paru print

# -----------------------------------------------------------------------------
# 5. Git & Version Control
# -----------------------------------------------------------------------------
alias g "git"
alias ga "git add"
alias gita "git add ."
alias gb "git branch"
alias gc "git clone"
alias gcm "git commit -m"
alias gcs "git commit -S -m" # Signed commit
alias gitc 'git commit -S'
alias gco "git checkout"
alias gcob "git checkout -b"
alias gd "git difftool"
alias gdc "git difftool --cached"
alias gitd 'git diff HEAD'
alias gf "git fetch"
alias gg "git graph"
alias gm "git merge"
alias gp 'git push'
alias gpr "gh pr create"
alias gr "git rebase -i"
alias gs "git status -sb"
alias gt "git tag"
alias gu "git reset @ --"   # Unstage changes
alias gx "git reset --hard @" # Discard all changes
alias svn "svn --config-dir '$XDG_CONFIG_HOME'/subversion"

# -----------------------------------------------------------------------------
# 6. Search, Find & View
# -----------------------------------------------------------------------------
alias find="fd"
alias grep="batgrep"
alias diff 'diff --color=auto'
alias cat "bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never"
alias man="batman"
alias fgr "fzf-grep (pwd)"
alias cg "fzf-grep $HOME/.config"

# -----------------------------------------------------------------------------
# 7. Editors & Development
# -----------------------------------------------------------------------------
alias vim="nvim"
alias svim="sudo nvim"
alias e "$EDITOR"
alias se "sudo $EDITOR"
alias vc 'code'
alias vimdiff "nvim -d --cmd ':lua vim.g.noplugins=1'"
alias todo="nvim ~/Areas/Productive/todo.md"

# Custom Neovim configurations
alias based "NVIM_APPNAME=based nvim"

# FZF integration with editor
alias fe "fzf-fd (pwd) | xargs -r nvim"
alias be "fzf-fd $HOME/.local/bin | xargs -r nvim"

# Build tools
alias cr='cargo run'
alias mkpc='makepkg -g >> PKGBUILD'
alias mkps='makepkg --printsrcinfo > .SRCINFO'
alias mke 'sudo make install'
alias npm="echo 'Run bun instead'" # Reminder to use Bun
alias stow="stow -t /home/st4rk"
# -----------------------------------------------------------------------------
# 8. Networking & Web
# -----------------------------------------------------------------------------
alias ip 'ip -color=auto'
alias proxychains "proxychains -q"
alias curld "curl -A 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/536.36'"
alias curlm "curl -A 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.12 Mobile/10B329 Safari/8536.25'"
alias curlh "curl -sILX GET"
alias ixio="curl -F 'f:1=<-' ix.io"   # Pipe to ix.io pastebin
alias to0x0="0x0 -"                   # Pipe to 0x0.st file hosting

# yt-dlp
alias yt "yt-dlp --embed-metadata -i"
alias yta "yt-dlp -x -f bestaudio/best"
alias ytmp3 "yt-dlp --ignore-errors -x --audio-format mp3 -f bestaudio --audio-quality 0 --embed-metadata --embed-thumbnail --output '%(title)s.%(ext)s'"
alias ytgetplaylist="yt-dlp --flat-playlist --print title"

# -----------------------------------------------------------------------------
# 9. Terminal & Shell Utilities
# -----------------------------------------------------------------------------
alias c 'clear'
alias q='exit'
alias :q='exit'
alias reload 'source ~/.config/fish/config.fish; and echo "Fish config reloaded."'
alias fch 'fastfetch --logo (/usr/bin/find ~/.local/share/icons -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.svg" \) | shuf -n 1)'
alias df="duf" # Disk usage utility
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"' # List disk usage sorted
alias dysk 'dysk -u binary'
alias ncdu 'ncdu --color dark'

# -----------------------------------------------------------------------------
# 10. Application-Specific & Miscellaneous
# -----------------------------------------------------------------------------
alias hyprpicker="hyprpicker -a"
alias lock='key-scripts -l'
alias scr="scrcpy --keyboard=uhid --no-audio & disown && exit"
alias toclipboard='wl-copy'
alias lsserv='systemctl list-unit-files --state=enabled'
alias ffmpeg "ffmpeg -hide_banner"
alias doc "sudo docker"
alias adb 'env HOME="$XDG_DATA_HOME/android" adb'
