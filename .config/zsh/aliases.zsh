##
## Aliases
##

alias q="exit"
alias cleanram="sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"
alias trim_all="sudo fstrim -va"
alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mtar='tar -zcvf' # mtar <archive_compress>
alias utar='tar -zxvf' # utar <archive_decompress> <file_list>
alias uz='unzip' # uz <archive_decompress> -d <dir>
alias reload='source ~/.zprofile'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias fm='lf'
alias pacin="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias paruin="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro  paru -S"
alias pacrem="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias pac="pacman -Q | fzf"
alias parucom="paru -Gc"
alias parupd="paru -Qua"
alias pacupd="pacman -Qu"
alias parucheck="paru -Gp"
alias cleanpac='sudo pacman -Rns $(pacman -Qtdq); paru -c'
alias installed="grep -i installed /var/log/pacman.log"
alias cat="bat --color always --plain"
alias grep='grep --color=auto'
alias ll="ls -lahF --color=always"
alias e="$EDITOR"
alias se="sudo $EDITOR"
alias g="git"
alias cat="bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never"
alias temp="cd /tmp/"

# Colorize commands when possible
alias \
    grep="grep --color=auto" \
    diff="diff --color=auto" \
    ip="ip -color=auto" \
    ncdu="ncdu --color dark"

# Programs
# Dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


#git
alias ga="git add"
alias gb="git branch"
alias gc="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcs="git commit -S -m"
alias gd="git difftool"
alias gdc="git difftool --cached"
alias gf="git fetch"
alias gg="git graph"
alias ggg="git graphgpg"
alias gm="git merge"
alias gp="git push"
alias gpr="gh pr create"
alias gr="git rebase -i"
alias gs="git status -sb"
alias gt="git tag"
alias gu="git reset @ --" #think git unstage
alias gx="git reset --hard @"

#overrides
alias cp="cp -r"
alias mv='mv -iv'
alias rm='rm -vr'
alias scp="scp -r"
alias vimdiff="nvim -d --cmd ':lua vim.g.noplugins=1'"
alias doc="sudo docker"
alias proxychains="proxychains -q"
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias aga="ag --hidden --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias ytmp3="yt-dlp --ignore-errors -x --audio-format mp3 -f bestaudio --audio-quality 0 --embed-metadata --embed-thumbnail --output '%(title)s.%(ext)s'"
#curl
alias curlh="curl -sILX GET"
alias curld="curl -A \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36\""
alias curlm="curl -A \"Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.12 Mobile/10B329 Safari/8536.25\""
alias us="systemctl --user"
alias rs="sudo systemctl"

# Suffix aliases
alias -s md=nvim
alias -s html=nvim

# Global aliases
alias -g C="| $CLIPCOPY"
alias -g F="| fpp -ko -nfc"
alias -g G="| grep"
alias -g L="| wc -l"
alias -g Q="&& exit"
alias -g Z="| fzf"
alias -g wcc="| wc -m"
alias -g wcw="| wc -w"

# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias prd='$aurhelper -R' # uninstall package
alias suu='$aurhelper -Syu' # update system/package/aur
alias pr='$aurhelper -S' #instal package
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias updatemirror='sudo reflector --save /etc/pacman.d/mirrorlist --protocol https --country Singapore --latest 5 --sort age --fastest 5'
alias vc='code' # gui code editor
alias fz='read | fzf --query "$2"'
alias fch='fastfetch'
alias mke='sudo make install'
alias lgout='systemctl suspend'
alias youtube="mov-cli -s youtube"
alias chmd="chmod +x "
alias setbg="setbg ~/Pictures/Wallpapers"
alias cleanup="sudo pacman -Qtdq | sudo pacman -Rns -"
# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# vim:ft=zsh
