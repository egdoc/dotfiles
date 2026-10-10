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
alias gpgpub='gpg --list-keys --with-subkey-fingerprints --with-keygrip'
alias gpgsec='gpg --list-secret-keys --with-subkey-fingerprints --with-keygrip'

# ls aliases
alias la='ls -al'
alias lz='ls -alZ'

# rsync aliases
alias rsyncx='rsync --archive --acls --xattrs --hard-links'

# Virtualenv aliases
alias ve="python -m venv .venv && source .venv/bin/activate"

# Alias vim to vimx if the latter is installed
if command -v vimx &> /dev/null; then
  alias vim="vimx"
fi


#
# Functions
#

# Add directory to PATH only if it is not already part of it.
# Arguments:
#   Path of the directory to add to PATH
#   Position of the directory relative to PATH. If "after" is used,
#     the directory is appended to path, otherwise it is prepended.
pathmunge() {
  local -r dir="$1"
  local -r pos="$2"

  [[ -h "${dir}" ]] && return

  case ":${PATH}:" in
    *:"${dir}":*)
      ;;
    *)
      if [[ "${pos}" == "after" ]] ; then
        PATH=$PATH:"${dir}"
      else
        PATH="${dir}":$PATH
      fi
      ;;
  esac
}

# Extract rpm package in current working directory.
xrpm() {
  rpm2cpio "$1" | cpio -idmv
}
