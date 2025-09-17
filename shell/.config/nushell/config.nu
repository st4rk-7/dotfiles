# ~/.config/nushell/config.nu
#
# Main Nushell configuration file.

# 1. Load Environment Variables
# ---
# All environment variables are stored in 'env.nu' to keep this file clean.
source ~/.config/nushell/env.nu


# 2. External Tool Integrations
# ---
# This section MUST be loaded before the $env.config block that uses its commands.
# It defines the commands for starship, zoxide, atuin, and carapace.
use ~/.cache/starship/init.nu
source ~/.zoxide.nu

source ~/.local/share/atuin/init.nu
source ~/.cache/carapace/init.nu


# 3. Core Nushell Configuration
# ---
# This block configures Nushell's behavior and enables Carapace completions.
$env.config = {
    show_banner: false, edit_mode: "vi", buffer_editor: "hx",
    completions: {
        algorithm: "substring"
        sort: "smart"
        case_sensitive: false
        quick: true
        partial: true
        use_ls_colors: true
        # --- CORRECTED Carapace integration with file path fallback ---
        external: {
            enable: true
            # This closure now tries Carapace, but if Carapace offers no suggestions,
            # it runs Nushell's built-in file and directory completer.
            completer: {||
                let line = $in.line
                let completions = carapace _carapace nushell $line
                if ($completions | is-empty) {
                    filepath_completion $line
                } else {
                    $completions
                }
            }
        }
    },
    shell_integration: { osc2: true, osc7: true, osc8: true },
    use_kitty_protocol: true, bracketed_paste: true, use_ansi_coloring: true, error_style: "fancy",
    display_errors: { exit_code: false, termination_signal: true },
    table: { mode: "single", index_mode: "always", show_empty: true, padding: { left: 1, right: 1 }, trim: { methodology: "wrapping", wrapping_try_keep_words: true, truncating_suffix: "..." }, header_on_separator: true, abbreviated_row_count: null, footer_inheritance: true },
    ls: { use_ls_colors: true }, rm: { always_trash: false }, cursor_shape: { vi_insert: "line", vi_normal: "block" }, highlight_resolved_externals: true

}




# 5. FZF Theming and Wrapper
let fzf_theme_tokyonight = [
  "--highlight-line", "--info=inline-right", "--ansi", "--layout=reverse", "--preview-window=border-left",
  "--border=block", "--no-scrollbar", "--color=bg+:#283457", "--color=bg:#16161e",
  "--color=border:#313244", "--color=fg:#c0caf5", "--color=gutter:#16161e", "--color=header:#ff9e64",
  "--color=hl+:#2ac3de", "--color=hl:#2ac3de", "--color=info:#545c7e", "--color=marker:#ff007c",
  "--color=pointer:#ff007c", "--color=prompt:#2ac3de", "--color=query:#c0caf5:regular",
  "--color=scrollbar:#27a1b9", "--color=separator:#ff9e64", "--color=spinner:#ff007c"
]
def fzf [...args] { ^fzf ...$args ...$fzf_theme_tokyonight }


# 6. Custom Commands & Functions
# ---
# Note: My buggy, hand-written `def z` has been REMOVED.
# `source ~/.zoxide.nu` provides the correct one automatically.
# ---
def fcd [] { let dir = (fd --type d | fzf | str trim); if ($dir != "") { cd $dir } }
def --env fm [...args] { let tmp = (mktemp -t "yazi-cwd.XXXXX"); yazi ...$args --cwd-file $tmp; let cwd = (open $tmp); if $cwd != "" and $cwd != $env.PWD { cd $cwd }; rm -fp $tmp }

def fe [] { fzf-fd (pwd) | xargs -r nvim }
def be [] { fzf-fd ~/.local/bin | xargs -r nvim }
def fgr [] { fzf-grep (pwd) }
def cg [] { fzf-grep ~/.config }
def dots [...rest] { git --git-dir=($env.HOME | path join ".dotfiles/") --work-tree=($env.HOME) $rest }
def adb [...rest] { with-env { HOME: ($env.XDG_DATA_HOME | path join "android") } { ^adb $rest } }
def psg [] { ^ps aux | grep -v grep | grep -i -e VSZ -e }
def pac [] { pacman -Q | fzf }
def pacin [] { pacman -Slq | ^fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print $2}")' ...$fzf_theme_tokyonight | xargs -ro sudo pacman -S }
def paruin [] { run-external $env.aurhelper "-Slq" | ^fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk "{print $2}")' ...$fzf_theme_tokyonight | xargs -ro ($env.aurhelper) -S }
def pacrem [] { pacman -Qq | ^fzf --multi --preview 'pacman -Qi {1}' ...$fzf_theme_tokyonight | xargs -ro sudo pacman -Rns }
def cleanpac [] { sudo pacman -Rns (^pacman -Qtdq); paru -c }
def cleanup [] { sudo pacman -Qtdq | sudo pacman -Rns - }
def reload [] { exec nu }
def q [] { exit }
def x [] { exit }
def suu [] { run-external $env.aurhelper "-Syu" }
def pr [...rest] { run-external $env.aurhelper "-S" ...$rest }
def prd [...rest] { run-external $env.aurhelper "-Rns" ...$rest }
def pa [...rest] { run-external $env.aurhelper "-Ss" ...$rest }
def pl [...rest] { run-external $env.aurhelper "-Qs" ...$rest }
def pc [] { run-external $env.aurhelper "-Sc" }
def zrm [] {
    let current_dir = $env.PWD
    zoxide remove $current_dir
    print $"Removed '($current_dir)' from zoxide history."
}


# 7. Aliases (Simple Substitutions)
# ---
alias e = nvim; alias se = sudo nvim; alias vc = code; alias vim = nvim; alias vimdiff = nvim -d;alias b = bash -c; alias based = NVIM_APPNAME=based nvim; alias ce = confedit
alias c = clear; alias sdn = sudo shutdown -h now; alias lgout = systemctl suspend; alias rs = sudo systemctl; alias us = systemctl --user; alias ka = killall; alias cleanram = sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'; alias trim_all = sudo fstrim -va;
alias .. = cd ..; alias ... = cd ../..; alias .... = cd ../../..; alias ..... = cd ../../../..; alias ...... = cd ../../../../..; alias temp = cd /tmp/; alias ls = eza -1 --icons=auto; alias l = eza -lh --icons=auto; alias ll = eza -lha --icons=auto --group-directories-first; alias lsa = eza -a --icons --group-directories-first; alias ld = eza -lhD --icons=auto; alias lt = eza -T --icons=auto; alias lst = eza -T --icons; alias cp = ^cp -ivr; alias mv = ^mv -iv; alias rm = ^rm -vrI; alias mkdir = ^mkdir -pv; alias mkd = ^mkdir -pv; alias scp = scp -r; alias chmd = chmod +x; alias dysk = dysk -u binary; alias ncdu = ncdu --color dark; alias mtar = tar -zcvf; alias utar = tar -zxvf; alias uz = unzip
alias pacupd = pacman -Qu; alias parupd = paru -Qua; alias installed = grep -i installed /var/log/pacman.log; alias parucom = paru -Gc; alias parucheck = paru -Gp; alias mke = sudo make install; alias ua-update-all = sh -c 'export TMPFILE="$(mktemp)"; sudo true; rate-mirrors --save=$TMPFILE arch --max-delay=21600 && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup && sudo mv $TMPFILE /etc/pacman.d/mirrorlist && paru -Syyu --noconfirm'
alias grep = rg; alias diff = diff --color=auto; alias ag = ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'; alias aga = ag --hidden --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'
alias g = git; alias add = git add .; alias commit = git commit; alias push = git push; alias pull = git pull; alias gco = git checkout; alias gcld = git clone --depth 1; alias gitgrep = git ls-files | rg; alias ga = git add; alias gb = git branch; alias gc = git clone; alias gcm = git commit -m; alias gcs = git commit -S -m; alias gcob = git checkout -b; alias gd = git difftool; alias gdc = git difftool --cached; alias gf = git fetch; alias gg = git graph; alias gm = git merge; alias gp = git push; alias gpr = gh pr create; alias gr = git rebase -i; alias gs = git status -sb; alias gt = git tag; alias gu = git reset @ --; alias gx = git reset --hard @
alias ip = ip -color=auto; alias proxychains = proxychains -q; alias curlh = curl -sILX GET; alias curld = curl -A "Mozilla/v5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36"; alias curlm = curl -A "Mozilla/v5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.12 Mobile/10B329 Safari/8536.25"
alias cat = bat --number --color=always --paging=never --tabs=2 --wrap=never
alias yt = yt-dlp --embed-metadata -i; alias yta = yt-dlp -x -f bestaudio/best; alias ytmp3 = yt-dlp --ignore-errors -x --audio-format mp3 -f bestaudio --audio-quality 0 --embed-metadata --embed-thumbnail --output '%(title)s.%(ext)s'; alias youtube = mov-cli -s youtube; alias ffmpeg = ffmpeg -hide_banner; alias setbg = setbg ~/Pictures/Wallpapers
alias doc = sudo docker

# --- NEW: Sudo Aliases ---
# Aliases from your Zsh setup. I've included the ones you listed.
alias mount = sudo mount
alias umount = sudo umount
alias pacman = sudo pacman
alias updatedb = sudo updatedb
alias su = sudo su
alias shutdown = sudo shutdown
alias poweroff = sudo poweroff
alias reboot = sudo reboot
alias fch = fastfetch