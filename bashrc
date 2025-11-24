# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Aliases
alias nukedocker='docker stop $(docker ps -q); docker system prune --all --volumes'
alias clrtmp='find /tmp -maxdepth 1 -user $(whoami) -exec rm -rf {} \;'
alias venv="python -m venv .venv && source .venv/bin/activate"
