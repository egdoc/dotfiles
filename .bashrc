# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Aliases
alias nukedocker='docker stop $(docker ps -q); docker system prune --all --volumes'
alias virtualenv="python -m venv"

# Functions
resticbk() {
  local -r repo="$1"
  restic backup --verbose --repo="${repo}" \
    ~/Documents \
    ~/.gnupg \
    ~/.ssh \
    ~/.mozilla \
    ~/.config/keepassxc \
    ~/.local/share/lftp \
    ~/.local/share/keepassxc
}
