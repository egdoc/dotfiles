# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Aliases
alias nukedocker='docker stop $(docker ps -q); docker system prune --all --volumes'
alias virtualenv="python -m venv"

# Connect to an FTP host using lftp and credentials
# stored in password-store database. Credentials
# must be stored in the following format:
#
# <password>
# login: <login>
# url: <url>
#
# Arguments:
#   $1: The password-store entry
pftp() {
  data="$(pass "$1/ftp")"

  if [ $? -eq 0 ]; then
    IFS=$'\n' read -d '' -r password login url <<< "${data}"
    export LFTP_PASSWORD="${password}"
    lftp \
      --env-password \
      --user "$(echo "${login}" | cut -d ' ' -f2)" \
      "$(echo "${url}" | cut -d ' ' -f 2)"
  fi
}
