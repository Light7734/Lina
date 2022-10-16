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
export LC_ALL="C"

################################################################
## ALIASES
alias icat='kitty +kitten icat'
alias zsrc='source ~/.zshrc'

alias v='nvim'
alias vv='neovide --multigrid --noidle'

alias q='exit'
alias :q='exit'
alias :wq='exit'
alias :qa='exit'

alias wacom='xsetwacom --set 9 Area 15200 8550 0 0'
alias picom='picom -b --config="/home/light/.config/picom/picom.confg"'

alias bitch='sudo'
alias please='sudo'
alias communistify='chmod +777'

alias bg='cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
alias b='cmake --build build -j`nproc`'
alias b1='cmake --build build'

# list
alias l='\colorls -l --sf'

# list all
alias la='\colorls -lA --sf'

# list simple
alias ls='\colorls --sf'

# list simple all 
alias lsa='\colorls -A --sf'

alias ~="c ~"

alias ..='c ../'
alias ...='c ../../'
alias ....='c ../../../'
alias .....='c ../../../../'
alias ......='c ../../../../../'

c() # (cd) && clear && list
{
    if [[ $# -ne 0 ]] ; then
        cd $1
    fi
    clear && l
}

ca() # (cd) && clear && list all
{
    if [[ $# -ne 0 ]] ; then
        cd $1
    fi
    clear && la
}

cs() # (cd) && clear && list(simple)
{
    if [[ $# -ne 0 ]] ; then
        cd $1
    fi
    clear && ls
}

csa() # (cd) && clear && list(simple) all
{
    if [[ $# -ne 0 ]] ; then
        cd $1
    fi
    clear && lsa
}

cn() # (cd) && clear && neofetch
{
    if [[ $# -ne 0 ]] ; then
        cd $1
    fi
    clear && neofetch
}

cgs() # (cd) && clear && git status
{
    if [[ $# -ne 0 ]] ; then
        cd $1
    fi
    clear && git status
}

picomadd() # add exception to opacity
{
    sed -i '/# OPACITY_RULE/i ,"100:name *= '\'$1\''"' ~/.config/picom/picom.confg
}

eval $(thefuck --alias)

cn
