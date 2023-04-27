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
export PATH="${PATH}:/home/light/.local/bin:/home/light/scripts/"
export LC_ALL="C"

################################################################
## ALIASES
alias icat='kitty +kitten icat'
alias zsrc='source ~/.zshrc'

alias v='~/downloads/nvim/nvim-linux64/bin/nvim'
alias vv='neovide --multigrid --noidle --neovim-bin ~/downloads/nvim/nvim-linux64/bin/nvim && exit'

alias vpn='expressvpn'

alias q='exit'
alias :q='exit'
alias :wq='exit'
alias :qa='exit'

alias wacom='xsetwacom --set 9 Area 15200 8550 0 0'

alias bitch='sudo'
alias please='sudo'
alias communistify='chmod +777'

alias bg='cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=DEBUG'
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

alias randwall='feh --bg-fill --randomize ~/pictures/wallpapers/'
alias setwall='feh --bg-fill'

alias mpv='mpv --input-ipc-server='/tmp/mpvsocket''

alias poweroff='sudo -v ; mpv --no-terminal ~/.config/xmonad/poweroff.wav ; sudo poweroff'

pomodoro_work()
{
    sleep 1h
    mpv ~/.config/xmonad/beep.mp3 --loop --volume=120
}

pomodoro_rest()
{
    sleep 10m
    mpv ~/.config/xmonad/beep.mp3 --loop --volume=120
}

c()
{
    cd ${1:-.} ; clear ; l
}

ca()
{
    cd ${1:-.} ; clear ; la
}

cs()
{
    cd  ${1:-.} ; clear ; ls
}

csa()
{
    cd ${1:-.} ; clear ; lsa
}

cn()
{
    cd ${1:-.} ; clear ; neofetch
}

cgs()
{
    cd ${1:-.} ; clear ; git status
}

picomadd() # add exception to opacity
{
    sed -i '/# OPACITY_RULE/i ,"100:name *= '\'$1\''"' ~/.config/picom/picom.conf
}

fortune | cowsay  | lolcat
