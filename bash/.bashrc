#
# ~/.bashrc
#

# Add ~/.local/bin to PATH
export PATH="$PATH:$HOME/Scripts:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Shell Options
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
set -o noclobber
set -o vi

# Alias Definitions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# fzf
[ -f /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash

# Doas bash-completion
complete -cf doas

PS1="[\u@\h \W]\$ "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('strat quantum /home/four/.local/share/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/four/.local/share/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/four/.local/share/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/four/.local/share/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

