# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Aliases
alias nukedocker='docker stop $(docker ps -q); docker system prune --all --volumes'
alias virtualenv="python -m venv"


# Extract latest snapshot from Borg repository
#
# Arguments:
#   Path of the Borg repository
#   Path of the extraction target directory (default is /)
borg_extract_latest() {
  if [ "$#" -eq 0 ]; then
    echo "Missing Borg repository path, aborting." >&2
    return 1
  fi

  local repo; repo="$(realpath "$1")"
  local target; target="${2:-/}"
  local latest; latest="$(borg list --last 1 "${repo}" | cut -d ' ' -f1)"

  cd "${target}" && borg extract --list "${repo}::${latest}"
}
