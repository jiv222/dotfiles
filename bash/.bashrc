#
# ~/.bashrc
#

# Add ~/.local/bin to PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# History Settings
HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%h %d %H:%M:%S "
shopt -s histappend
HISTSIZE=3000
HISTFILESIZE=5000
export PROMPT_COMMAND="history -a; history -c; history -r"

PS1="[\u@\h \W]\$ "
# PS1='\[\e[01;31m\]\h\[\e[01;34m\] \W \$\[\e[00m\] '

# Default programs
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

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
