# Set ZDOTDIR to ~/.config/zsh if not already set
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

while read file
do
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
theme
env
aliases
utility
options
plugins
keybinds
prompt
private
EOF

# vim:ft=zsh
