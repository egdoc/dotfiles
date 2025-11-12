# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Aliases
alias nukedocker='docker stop $(docker ps -q); docker system prune --all --volumes'
alias clrtmp='find /tmp -maxdepth 1 -user $(whoami) -exec rm -rf {} \;'
alias virtualenv="python -m venv"


# Sync files in home directory to specified destination
# Arguments:
#   Destination directory
homesync() {
  local -r dest="$1"

  rsync \
    --archive \
    --hard-links \
    --acls \
    --xattrs \
    --relative \
    --delete \
    ~/Documents \
    ~/.ssh \
    ~/.gnupg \
    ~/.mozilla \
    ~/.config/calibre \
    ~/.config/keepassxc \
    ~/.local/share/lftp/bookmarks \
    "${dest}"
}
