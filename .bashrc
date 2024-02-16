# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

PS1='[\u@\h \W]$ '

alias nukepodman='podman stop $(podman ps -qa); podman system prune --force --all --volumes'
alias virtualenv="python -m venv"

if [ -S /run/user/${UID}/docker.sock ]; then
  export DOCKER_HOST=unix:///run/user/${UID}/docker.sock
fi
