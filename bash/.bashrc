#
# ~/.bashrc
#

# Add ~/.local/bin to PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

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
