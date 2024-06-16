function font-search () {
  fc-list | cut -d: -f2- | fzf --info=inline --padding=1
}

# Use lf to switch directories and bind it to ctrl-o
function lfcd () {
  tmp="$(mktemp -uq)"
  trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}

# Define functions and completions.
#function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
#compdef _directories md

eval "$(navi widget zsh)"
