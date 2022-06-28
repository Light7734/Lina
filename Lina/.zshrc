################################################################
## ZSH CONFIGURATIONS
HISTFILE=~/.zshhist                # Save history file
HISTSIZE=2048                      # Save history zsh max lines
SAVEHIST=4096                      # Save history file max lines
setopt autocd                      # Automatically change directory if only a path was provided
unsetopt beep notify               # No bells!
bindkey -v                         # Use VI Keybindings
PROMPT="%F{green}%n@%m%f %~ $ "    # The prompt

################################################################
## EXPORTS
export PATH="${PATH}:/home/light/.local/bin"

################################################################
## ALIASES
alias ...='../../'
alias ....='../../../'
alias .....='../../../../'

alias l='ls -ls --color'
alias la='l -A'
alias ls='ls --color'
alias lsa='ls -A --color'

alias clearl='clear && ls -ls --color'
alias clearla='clear && l -A'
alias clearls='clear && ls --color'
alias clearlsa='clear && ls -A --color'
alias clearn='clear && neofetch'
alias cleargs='clear && git status'

alias v='lvim'
alias vi='lvim'
alias vim='lvim'

alias zsrc='source ~/.zshrc'
alias q='exit'
alias :q='exit'
alias :wq='exit'
alias :qa='exit'
alias icat='kitty +kitten icat '

alias c='xclip -sel c'
alias co='xclip -o c'
alias wacom='xsetwacom set 19 Area $[15200+2000] $[9500+2000] $[-2000] $[-2000]'

alias picom='picom -b --config="/home/light/.config/picom/picom.confg"'

alias lofi='mpv --shuffle ~/music/Lofi'
alias cdlm='cdl ~/music'

alias setwall='nitrogen --save --set-zoom-fill'

cdl()
{
    cd $1
    clear
    l
}

cdla()
{
    cd $1
    clear
    la
}

cdls()
{
    cd $1
    clear
    ls
}

cdlsa()
{
    cd $1
    clear
    lsa
}

################################################################
## FUNCTIONS
picomadd() # add exception to opacity
{
    sed -i '/# OPACITY_RULE/i ,"100:name *= '\'$1\''"' .config/picom/picom.confg
}
 
clear && neofetch 
