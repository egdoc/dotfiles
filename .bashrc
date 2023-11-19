# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Functions
thinkpad_setcharge() {
  echo "$1" | sudo tee /sys/class/power_supply/BAT?/charge_start_threshold
  echo "$2" | sudo tee /sys/class/power_supply/BAT?/charge_stop_threshold
}

# Aliases
alias virtualenv="python -m venv"
alias safecharge="thinkpad_setcharge 40 50"
alias fullcharge="thinkpad_setcharge 80 100"


if [ -S /run/user/${UID}/docker.sock ]; then
  export DOCKER_HOST=unix:///run/user/${UID}/docker.sock
fi
