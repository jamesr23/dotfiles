# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ~/.config/aliases
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt prompt_subst
__git_ps1() {
    if git status >/dev/null 2>&1; then
        local branch=$(git show-branch | grep -o "\[.*\]" | tr -d ']' | tr -d '[')
        if git status 2>/dev/null | grep -q "Changes to be committed"; then
            echo "%F{red}*$branch%f"
        else
            echo "%F{green}$branch%f"
        fi
    fi
}

export PROMPT=" %F{blue}>%f "
# export RPROMPT='$(__git_ps1)'

autoload -Uz vcs_info
precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{green}%u%c%b%f'
zstyle ':vcs_info:git:*' actionformat '%F{red}%u%c%b(%a)%f'
export RPROMPT='${vcs_info_msg_0_}'

zmodload zsh/complist
zstyle ':completion:*' menu select

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^ ' autosuggest-accept

bindkey -s '^h' 'cd ..^M'
    
# auto complete functions below
_wp() {
    local -a args
    args+=(
        '-l[list wallpaper image names]'
        '-d[show wallpaper directory]'
        '-n[notify with notify-send]'
    )
    # _arguments $args[@]
    _arguments '*: :_files -W $(wp -d)'
}
compdef _wp wp
