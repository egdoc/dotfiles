#
# .bashrc
#
# Author: Egidio Docile
#

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc


#
# Shell options
#
shopt -s autocd
shopt -s histappend

#
# Shell variables
#
HISTCONTROL='ignoreboth'
HISTFILE=~/.bash_history
HISTSIZE=5000
HISTFILESIZE=5000


#
# Aliases
#

# Git aliases
alias gb='git branch'
alias gc='git commit'
alias gi='git init'
alias gl='git log'
alias gp='git pull --rebase'
alias gs='git status'

# GPG aliases
alias gpgpub='gpg --list-keys --with-subkey-fingerprints'
alias gpgsec='gpg --list-secret-keys --with-subkey-fingerprints'

# ls aliases
alias la='ls -al'
alias lz='ls -alZ'

# Virtualenv aliases
alias ve="python -m venv .venv && source .venv/bin/activate"

# Alias vim to vimx if the latter is installed
if command -v vimx &> /dev/null; then
  alias vim="vimx"
fi
