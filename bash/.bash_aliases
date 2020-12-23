#
# ~/.bash_aliases
#

## Aliases

alias xi='doas /usr/bin/xbps-install'
alias xr='doas /usr/bin/xbps-remove -R'
alias xq='xbps-query -Rs'

alias la='exa -a --color=always --group-directories-first'
alias l='exa -F --color=always --group-directories-first'
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

alias cp='cp -iv'
alias mv='mv -iv'
alias df='df -h'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias free='free -h'
alias cal="calcurse"
alias top="htop"
alias feh="feh --bg-scale"
alias xset='xset r rate 300 35'
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias vim='nvim'
alias usv="vsv -d ~/.local/var/service"
alias powertop='doas /usr/bin/powertop'
alias zzz='doas /usr/bin/zzz'
alias reboot='doas /bedrock/cross/pin/bin/reboot'
alias shutdown='doas /bedrock/cross/pin/bin/shutdown -h now'
alias gs='git status'
alias gb='git branch'
alias gc='git commit -m'
alias gch='git checkout'
alias vifm='bash ~/.config/vifm/scripts/vifmrun'
alias mutt='neomutt'

# Bedrock specific commands
alias archmake='doas strat -r arch make'
alias quant='cd /home/four/Projects/Quantum_Boady/ && strat -r ubuntu bash'
alias spicetify='strat arch spicetify'

# Dev commands
alias testvue='strat ubuntu npm run dev'

## Custom Functions
function extract () {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)    tar xjf $1      ;;
                *.tar.gz)     tar xzf $1      ;;
                *.tar.xz)     tar xvJf $1     ;;
                *.lzma)       unlzma $1       ;;
                *.bz2)        bunzip2 $1      ;;
                *.rar)        unrar e $1      ;;
                *.gz)         gunzip $1       ;;
                *.tar)        tar xf $1       ;;
                *.tbz2)       tar xjf $1      ;;
                *.tgz)        tar xzf $1      ;;
                *.zip)        unzip $1        ;;
                *.Z)          uncompress $1   ;;
                *.xz)         unxz $1         ;;
                *)    echo "'$1' cannot be extracted via extract command" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
    fi
}

function mkd()
{
  mkdir -p -- "$1" && cd "$1"
}

function cleantex()
{
  rm *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz
}
