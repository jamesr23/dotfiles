#
# ~/.bashrc
# 

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# aliases dont get transferred to subshells
[[ -f ~/.config/aliases ]] && source ~/.config/aliases

color() {
    echo "\[\e[$1m\]"
} 

red=$(color 31)
green=$(color 32)
yellow=$(color 33)
blue=$(color 34)
magenta=$(color 35)
cyan=$(color 36)
light_gray=$(color 37)
white=$(color 0)

unset -f color

# PS1
# PS1="$magenta[$light_cyan\T$magenta] $green\u$light_yellow@$blue\h$light_gray(\s \v)$white > $magenta[$cyan\w$magenta] $red\$$white "

# simple PS1
export PS1="$magenta[$blue\u$yellow@$red\h$white $cyan\W$magenta]$green\$$white "

unset red
unset green
unset yellow
unset blue
unset magenta
unset cyan
unset light_gray
unset light_yellow
unset light_cyan
unset white

# modifier ( first argument )
# 0 - normal
# 1 - bold
# 4 - underline
# 5 - blink
# 7 - reverse foreground & background
# 8 - hidden ( passwords )

if test ! -z $DISPLAY; then
    setxkbmap us
    setxkbmap -option caps:none
    xmodmap -e 'keycode 0x42 = Escape'
fi

export HISTFILE="$HOME/dotfiles/.bash_history"
export HISTSIZE=1000

set -o vi
# neofetch

_wp() {
    COMPREPLY=()
    local cur="${COMP_WORDS[COMP_CWORD]}"
    if test "$COMP_CWORD" -eq 1; then
        COMPREPLY=($(compgen -W "$(ls $(wp -d))" -- "$cur"))
    fi
    return 0
}
complete -F _wp wp

function def() {
	sdcv -n --utf8-output --color "$@" 2>&1 | \
	fold --width=$(tput cols) | \
	less --quit-if-one-screen -RX
}


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
