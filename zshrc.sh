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
export PATH="${PATH}:/home/light/.local/bin:/home/light/scripts/:/opt/cuda/bin:/home/light/dev/meshoptimizer"
export LC_ALL="C"
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
export CPM_SOURCE_CACHE="${HOME}/.cache/CPM"
export GTEST_COLOR="yes"
export GPG_TTY=$(tty)

################################################################
## SOURCES
source "${HOME}/dev/google-cloud-sdk/completion.zsh.inc"
source "${HOME}/dev/google-cloud-sdk/path.zsh.inc"

################################################################
## ALIASES
alias icat='kitty +kitten icat'
alias zsrc='source ~/.zshrc'

alias clip="xclip -selection c"

alias v='nvim'
alias vv='neovide && exit'

alias q='exit'

alias pirate='aria2c --seed-time=0 --split=8'

# list
alias l='\eza --icons --sort type -TL1'
alias la='\eza --icons --sort type -T1' # all

# cd
alias ~="c ~"
alias ..='c ../'
alias ...='c ../../'
alias ....='c ../../../'
alias .....='c ../../../../'
alias ......='c ../../../../../'

c  () { cd ${1:-.} ; clear ; l          }
ca () { cd ${1:-.} ; clear ; la         }
cn () { cd ${1:-.} ; clear ; neofetch   }
cgs() { cd ${1:-.} ; clear ; git status }

# wallpaper
alias wallrand='feh --bg-fill --randomize ~/pictures/wallpapers/'
alias wall='feh --bg-fill'

alias mpv='mpv --input-ipc-server='/tmp/mpvsocket''
alias mpm='mpv  --no-video --input-ipc-server='/tmp/mpvsocket''

activate()
{
    if [[ "$1" == "bitwyre" ]]; then
        echo "Sourcing ${HOME}/envs/bitwyre_python/bin/activate..."
        source ${HOME}/envs/bitwyre_python/bin/activate
        source ${HOME}/envs/bitwyre_envs.sh

    elif if [[ "$1" == "help" || "$1" == "--help" || "$1" == "" ]]; then
        echo "Activates a python envirnoment, inspect ${HOME}/.zshrc for a list"

    else 
        echo "Sorry, invalid python environment name"

    fi
}

# adds exception to opacity
picomadd() { sed -i '/# OPACITY_RULE/i ,"100:name *= '\'$1\''"' ~/.config/picom/picom.conf }

setxkbmap -option caps:escape

c
