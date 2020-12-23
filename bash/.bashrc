#
# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Shell Options
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
shopt -s histappend
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

# Random color script
bash /home/four/.local/bin/color-scripts.sh random

eval "$(starship init bash)"
